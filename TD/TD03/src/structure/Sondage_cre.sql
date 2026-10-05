/*
============================================================================== A
Produit : CoFELI:Exemple/Sondage
Trimestre : 2026-3
Composant : Sondage_cre.sql (solution)
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.4 à 16.2
Responsables : ameni.souid@usherbrooke.ca ; christina.khnaisser@usherbrooke.ca ; luc.lavoie@usherbrooke.ca
Version : 0.1.1c
Statut : solution préliminaire
============================================================================== A
*/

/*
============================================================================== B
Référence du schéma correspondant au modèle Sondage documenté dans [epp].
============================================================================== B
*/

SET SCHEMA 'Sondage' ;

--
-- Domaines
--
CREATE DOMAIN Courriel AS
  -- Cette validation est partielle, voir le commentaire final Y à ce sujet.
  VARCHAR(512)
  CONSTRAINT Courriel_inv
    CHECK (value SIMILAR TO '[[:alnum:]]+(\.[[:alnum:]]+)*\@[[:alnum:]]+(\.[[:alnum:]]+)*')
  ;

CREATE DOMAIN IdQuestionnaire AS
  CHAR(7)
  CONSTRAINT IdQuestionnaire_inv CHECK (value SIMILAR TO 'Q[0-9]{6}')
  ;

CREATE DOMAIN Matricule AS
  CHAR(8)
  CONSTRAINT Matricule_inv CHECK (value SIMILAR TO '[0-9]{8}')
  ;

CREATE DOMAIN NoChoix AS
  -- Une limite arbitraire a été établie à 1000.
  SMALLINT -- Le choix de SMALLINT est discutable, il économise l’espace requis
           -- au détriment de conversions de type plus fréquentes, particulièrement
           -- lorsque des constantes sont utilisées, car PostgreSQL les considère
           -- de type entier sans conversion implicite vers les autres types entiers.
  CONSTRAINT NoChoix_inv CHECK (value BETWEEN 0 AND 999)
  ;

CREATE DOMAIN Nom AS
  -- Il est très difficile de faire une validation sur les noms et prénoms en tenant
  -- compte de plusieurs langues, même au sein d’un seul registre d’état civil.
  -- Nous nous contenterons ici de vérifier qu’il y a au moins un caractère.
  -- Une solution plus fine est présentée dans le commentaire final Y.
  VARCHAR(64)
  CONSTRAINT Nom_inv CHECK (LENGTH(value) > 0)
  ;

CREATE DOMAIN NoQuestion AS
  -- Une limite arbitraire a été établie à 10 000.
  SMALLINT -- Le choix de SMALLINT est discutable, voir NoChoix.
  CONSTRAINT NoQuestion_inv CHECK (value BETWEEN 0 AND 9999)
  ;

CREATE DOMAIN Titre AS
  -- Une limite arbitraire a été établie à 80 caractères.
  -- Rappel : un texte de longueur 0 est une valeur légitime.
  --          C’est même l’élément neutre de l’opération de concaténation.
  VARCHAR(80)
  CONSTRAINT Titre_inv CHECK (LENGTH(value) > 0)
  ;

CREATE DOMAIN TypeQuestion AS
  CHAR(4)
  CONSTRAINT TypeQuestion_inv CHECK (value IN ('QCM', 'QO', 'QCMO'))
  ;

CREATE DOMAIN Description AS
  VARCHAR(250)
  ;

--
-- Tables
--
CREATE TABLE Questionnaire
/*
Le questionnaire "idQ" dont le titre est "titre" a été créé par l’auteur "auteur";
la période de saisie des réponses débute le "dateDebut" et se termine le
"dateFin".
*/
  (
    idQ IdQuestionnaire NOT NULL,
    titre Titre NOT NULL,
    auteur Nom NOT NULL,
    dateDebut DATE NOT NULL,
    dateFin DATE NOT NULL,
    CONSTRAINT Questionnaire_cc0 PRIMARY KEY (idQ),
    CONSTRAINT Questionnaire_date CHECK (dateDebut <= dateFin)
  );

CREATE TABLE Question
/*
La question "noQ" appartenant au questionnaire "idQ" est définie par le libellé
"libelle", le type "typeQ" et le mode "mode".
*/
  (
    idQ IdQuestionnaire NOT NULL,
    noQ NoQuestion NOT NULL,
    typeQ TypeQuestion NOT NULL,
    obligatoire BOOLEAN NOT NULL,
    libelle Description NOT NULL,
    CONSTRAINT Question_cc0 PRIMARY KEY (idQ, noQ),
    CONSTRAINT Question_ce0 FOREIGN KEY (idQ) REFERENCES Questionnaire
  );

CREATE TABLE ChoixQCM
/*
Le choix "noChoix" de la question "noQ" appartenant au questionnaire "idQ"
possède la description "description".
*/
  (
    idQ IdQuestionnaire NOT NULL,
    noQ NoQuestion NOT NULL,
    noChoix NoChoix NOT NULL,
    description Description NOT NULL,
    CONSTRAINT ChoixQCM_cc0 PRIMARY KEY (idQ, noQ, noChoix),
    CONSTRAINT ChoixQCM_ce0 FOREIGN KEY (idQ, noQ) REFERENCES Question
  );

CREATE TABLE Repondant
/*
Le répondant dont le matricule est "matricule" porte le nom "nom", le
prénom "prenom" et peut être joint à l’adresse de courriel "courriel".
*/
  (
    matricule Matricule NOT NULL,
    nom Nom NOT NULL,
    prenom Nom NOT NULL,
    courriel Courriel NOT NULL,
    CONSTRAINT Repondant_cc0 PRIMARY KEY (matricule),
    CONSTRAINT Repondant_cc1 UNIQUE (courriel)
  );

CREATE TABLE Formulaire
/*
Le formulaire associé au questionnaire "idQ" et rempli par le répondant "matricule"
en date du "dateReponse" est identifié par ces deux premiers attributs.
*/
  (
    idQ IdQuestionnaire NOT NULL,
    matricule Matricule NOT NULL,
    dateReponse DATE NOT NULL,
    CONSTRAINT Formulaire_cc0 PRIMARY KEY (idQ, matricule),
    CONSTRAINT Formulaire_ce0 FOREIGN KEY (idQ) REFERENCES Questionnaire,
    CONSTRAINT Formulaire_ce1 FOREIGN KEY (matricule) REFERENCES Repondant
  );

CREATE TABLE Reponse
/*
Le répondant "matricule" a répondu à la question "noQ" du questionnaire "idQ".

Si noQ est une question à choix multiples, la réponse doit être complétée par une RCM.
Si c’est une question ouverte, elle doit être complétée par une RO.
Si c’est une question à choix multiples ouverts, elle doit être complétée par
l’une ou l’autre, mais par les deux.
*/
  (
    idQ IdQuestionnaire NOT NULL,
    matricule Matricule NOT NULL,
    noQ NoQuestion NOT NULL,
    CONSTRAINT Response_cc0 PRIMARY KEY (idQ, matricule, noQ),
    CONSTRAINT Response_ce0 FOREIGN KEY (idQ, matricule) REFERENCES Formulaire,
    CONSTRAINT Response_ce1 FOREIGN KEY (idQ, noQ) REFERENCES Question
  );

CREATE TABLE RCM
/*
Le répondant "matricule" ayant répondu à la question à choix multiples "noQ" du
questionnaire "idQ" a donné le choix "noChoix".
*/
  (
    idQ IdQuestionnaire NOT NULL,
    matricule Matricule NOT NULL,
    noQ NoQuestion NOT NULL,
    noChoix NoChoix NOT NULL,
    CONSTRAINT RCM_cc0 PRIMARY KEY (idQ, matricule, noQ),
    CONSTRAINT RCM_ce0 FOREIGN KEY (idQ, matricule, noQ) REFERENCES Reponse,
    CONSTRAINT RCM_ce1 FOREIGN KEY (idQ, noQ, noChoix) REFERENCES ChoixQCM
  );

CREATE TABLE RO
/*
Le répondant "matricule" ayant répondu à la question ouverte "noQ" du
questionnaire "idQ" a fourni la réponse "texteReponse".
*/
  (
    idQ IdQuestionnaire NOT NULL,
    matricule Matricule NOT NULL,
    noQ NoQuestion NOT NULL,
    texteReponse Description NOT NULL,
    CONSTRAINT RO_cc0 PRIMARY KEY (idQ, matricule, noQ),
    CONSTRAINT RO_ce0 FOREIGN KEY (idQ, matricule, noQ) REFERENCES Reponse
  );

/*
============================================================================== Y
La forme d’une adresse de courriel est établie dans le document

  RFC 5322 - Internet Message Format

publié par l’IETF en 2008.
La mise à jour RFC 6854 publiée en 2013 généralise le nom du domaine, mais nous
n’en tiendrons pas compte ici.

Synthèse de l'adresse de courriel proprement dite (AC)

.Grammaire
   addr-spec       =   local-part "@" domain
   local-part      =   dot-atom / quoted-string
   domain          =   dot-atom / domain-literal
   domain-literal  =   "[" *(dtext) "]"
   atom            =   1*atext
   dot-atom        =   dot-atom-text
   dot-atom-text   =   1*atext *("." 1*atext)
   quoted-string   =   DQUOTE *(qcontent) DQUOTE
   qcontent        =   qtext / quoted-pair
   quoted-pair     =   "\" (VCHAR / WSP)

Définition des ensembles de caractères requis, relativement à l’US-ASCII

.Ensemble de caractères
   dtext           =   %d33-90 /          ; Printable US-ASCII
                       %d94-126 /         ; characters not including "[", "]", or "\"
   atext           =   ALPHA / DIGIT /    ; Printable US-ASCII
                       "!" / "#" /        ;  characters not including
                       "$" / "%" /        ;  specials.  Used for atoms.
                       "&" / "'" /
                       "*" / "+" /
                       "-" / "/" /
                       "=" / "?" /
                       "^" / "_" /
                       "`" / "{" /
                       "|" / "}" /
                       "~"
   specials        =   "(" / ")" /        ; Special characters that do
                       "<" / ">" /        ;  not appear in atext
                       "[" / "]" /
                       ":" / ";" /
                       "@" / "\" /
                       "," / "." /
                       DQUOTE
   qtext           =   %d33 /             ; Printable US-ASCII
                       %d35-91 /          ;  characters not including
                       %d93-126 /         ;  "\" or the quote character

À noter que la syntaxe utilisée pour les expressions rationnelles est différente
de celle de SQL et de POSIX ; elle est décrite dans le document IETF

  RFC 5234 - Augmented BNF for Syntax Specifications: ABNF.

Finalement, on constate que le standard permet l’utilisation de tout caractère
qui n’entre pas en conflit avec les méta-caractères de l’adresse ou de
l’enveloppe d’un message (voir atext). Le responsable de l’attribution de courriels
au sein de l’université nous informe toutefois qu’il n’utilise que les lettres et
les chiffres.

La portée du système se limitant à la seule université,
nous en sommes ravis et cela nous permet de traduire la spécification de l’IETF
appliquée aux seuls domaines de l’université par le patron SQL suivant :

  '[a-z0-9]+(\.[a-z0-9]+)*\@[a-z0-9]+(\.[a-z0-9]+)*'

Nous entrevoyons toutefois des problèmes à venir, lorsqu’il faudra intégrer
l’accentuation des lettres latines, les alphabets non latins et les symboles
idéographiques (chinois, coréen, etc.). On peut faire mieux, en utilisant les
classes de caractères (character class), dénotée entre [: et :]

  '[[:alnum:]]+(\.[[:alnum:]]+)*\@[[:alnum:]]+(\.[[:alnum:]]+)*'

Cette dernière réponse était suffisante dans le cadre du présent travail.

Une autre approche doit cependant être utilisée si nous désirons coller
vraiment à la définition de l’IETF. Elle consiste à exclure les caractères
ne pouvant pas être utilisés, soit l’espace, les caractères de commande et
ceux de la catégorie specials. Pour cela, il faut utiliser la notation des ensembles
complémentaires dénotés par l’introduction du caractère accent-circonflexe (^)
après le crochet ouvrant :

  '[^][()<>:;@\\,."[:space:][:cntrl:]]'

en dénotant ce dernier patron btext, le nouveau patron complet peut désormais
être construit comme suit :

  btext+(\.btext)*\@btext+(\.btext)*

soit, in extenso :

  '[^][()<>:;@\\,."[:space:][:cntrl:]]+(\.[^][()<>:;@\\,."[:space:][:cntrl:]]+)*\@[^][()<>:;@\\,."[:space:][:cntrl:]]+(\.[^][()<>:;@\\,."[:space:][:cntrl:]]+)*'

.Note 0
Au sein de la dénotation d’ensemble de caractères débutant par
le crochet ouvrant ([) et se terminant par le crochet fermant (]),
une contre-oblique (\) devant le point (.) et le doublement de la contre-oblique
elle-même sont requis pour encore la présente de la contre-oblique du point
dans l'ensemble.

.Note 1
Un tel développement n’était pas requis pour obtenir une note de 100/100
dans le présent travail. :-)

.Note 2
Pour plus d’information relativement aux classes prédéfinies en PostgreSQL
(alnum, alpha, blank, cntrl, digit, graph, lower, print, punct, space, upper et xdigit),
voir la section suivante de la documentation de PostgreSQL
(section assez aride au demeurant) :

  en français :
    https://docs.postgresql.fr/current/functions-matching.html

  en anglais :
    https://www.postgresql.org/docs/current/functions-matching.html

Note 3 :
Un traitement exhaustif de la dénotation des courriels est proposé dans le
dépôt CoFELI:Exemples sous le nom IETF/RFC5322.

============================================================================== Y
*/

/*
============================================================================== Z
.Contributeurs :
  (CK01) christina.khnaisser@usherbrooke.ca,
  (LL01) luc.lavoie@usherbrooke.ca

.Adresse, droits d’auteur et copyright :
  Groupe Μῆτις (Métis)
  Département d’informatique
  Faculté des sciences
  Université de Sherbrooke
  Sherbrooke (Québec)  J1K 2R1
  Canada

  [CC-BY-NC-4.0 (http://creativecommons.org/licenses/by-nc/4.0)]

.Tâches projetées :
  * TODO 2024-05-19 : Changer les types SMALLINT pour INTEGER
    - La lourdeur notationnelle des conversions requises lors des appels de routines
      nuit à la pédagogie. Par ailleurs, le fait que ces mêmes conversions ne soient
      pas requises dans le contexte VALUES montre bien leur inutilité et qu'une
      meilleure prise ne charge de la théorie eut été possible.
  * TODO 2024-05-22 : Renommage
    - EstampilleM -> Estampille
    - ChoixQCM -> Choix
    - Généraliser la convention du général au particulier conforme à [std] ?
.Tâches réalisées :
  * 2024-05-12 (LL01) : Modifications des commentaires relatifs au demaine Courriel
    - Référence è l'exemple CoELI:Exemple/IETF/RFC5322
  * 2024-04-04 (LL01) : Restructuration pour intégration à CoFELI
    - Changement de noms, élimination des fichiers doublons
  * 2022-01-10 (LL01) : Diverses corrections de coquilles
    - Uniformisation des commentaires
  * 2020-09-20 (LL01) : Utilisation des domaines et types
    - Systématiser l’utilisation déclarations de domaines et de types
  * 2015-09-14 (LL01) : Revue
    - ajout du commentaire de la table Réponse
    - ajout du commentaire Y
  * 2015-08-20 (CK01) : Adaptation après revue
    - modélisation Question et Reponse
    - remplacement TEXT par VARCHAR(250)
  * 2015-08-16 (CK01) : Création initiale

.Références :
  * [epp] CoFELI:Exemples/Sondage/Sondage_DDV.pdf
  * [std] Akademia:Modules/BD190-STD-SQL-01_NDC.pdf

--------------------------------------------------------------------------------
-- fin de Sondage_cre.sql
============================================================================== Z
*/
