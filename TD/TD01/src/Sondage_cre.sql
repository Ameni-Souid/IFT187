/*
============================================================================== A
Produit : CoFELI:Exemple/Sondage
Trimestre : 2026-3
Composant : Sondage_cre.sql (ébauche)
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.4 à 16.2
Responsables : christina.khnaisser@usherbrooke.ca ; luc.lavoie@usherbrooke.ca
Version : 0.1.1a
Statut : travail en cours
============================================================================== A
*/

/*
============================================================================== B
Référence du schéma correspondant au modèle Sondage documenté dans [epp].
============================================================================== B
*/

SET SCHEMA 'Sondage' ;

CREATE DOMAIN IdQuestionnaire
/*
Trypon Tournesol a décider le numération qu'il entendait donner à ses questionnaires.
*/
  CHAR(7)
  CHECK (VALUE SIMILAR TO 'Q[0-9]{6}') ;

CREATE TABLE Questionnaire
/*
Le questionnaire "idQ" dont le titre est "titre" a été créé par l’auteur "auteur";
la période de saisie des réponses débute le "dateDebut" et se termine le
"dateFin".
*/
  (
    idQ IdQuestionnaire NOT NULL,
    titre VARCHAR(64) NOT NULL,
    auteur VARCHAR(64) NOT NULL,
    dateDebut DATE NOT NULL,
    dateFin DATE NOT NULL,
    CONSTRAINT Questionnaire_cc0 PRIMARY KEY (idQ),
    CONSTRAINT Questionnaire_date CHECK (dateDebut <= dateFin)
  );

--
-- À compléter par les contributeurs
--

/*
============================================================================== Z
.Contributeurs :
  (BG) Bernadette.Guérard@USherbrooke.ca,
  (AF) Anatole.France@USherbrooke.ca

.Adresse, droits d’auteur et copyright :
  Département d’informatique
  Faculté des sciences
  Université de Sherbrooke
  Sherbrooke (Québec)  J1K 2R1
  Canada

  [CC-BY-NC-4.0 (http://creativecommons.org/licenses/by-nc/4.0)]

.Tâches projetées :
  S.O.

.Tâches réalisées :
  * 2024-04-04 (LL01) : Restructuration pour intégration à CoFELI
    - Changement de noms, élimination des fichiers doublons
  * 2022-01-10 (LL01) : Diverses corrections de coquilles
    - Uniformisation des commentaires
  * 2015-09-14 (LL01) : Revue.
  * 2015-08-20 (CK01) : Création initiale.

.Références :
  * [epp] CoFELI:Exemples/Sondage/Sondage_DDV.pdf
  * [std] Akademia:Modules/BD190-STD-SQL-01_NDC.pdf

--------------------------------------------------------------------------------
-- fin de Sondage_cre.sql
============================================================================== Z
*/