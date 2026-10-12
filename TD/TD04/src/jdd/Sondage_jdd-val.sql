/*
============================================================================== A
Produit : CoFELI:Exemple/Sondage
Trimestre : 2026-3
Composant : Sondage_jdd-val.sql (solution)
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.4 à 16.2
Responsables : ameni.souid@usherbrooke.ca ; christina.khnaisser@usherbrooke.ca ; luc.lavoie@usherbrooke.ca
Version : 0.1.1a
Statut : solution préliminaire
============================================================================== A
*/

SET SCHEMA 'Sondage' ;

/*
============================================================================== B
Les préfixes de ligne "-- xox" sont destinés à être remplacés par des
instructions d’écriture lorsque le fichier est exécuté sous forme de script.
Par exemple,
  - "prompt " sous SQL*Plus (Oracle),
  - "\echo  " sous psql (PostgreSQL).
============================================================================== B
*/

-- x0x "=====================================================================" ;
-- x0x "Insertionss de données plausibles, sans échec" ;
-- x0x "=====================================================================" ;


-- x0x "Insertions dans Questionnaire"
INSERT INTO Questionnaire(idQ, titre, auteur, dateDebut, dateFin) VALUES
  ('Q000001', 'IFT187 - Semaine 0 : Les colles du prof', 'Luc Lavoie', '2015-08-18', '2015-08-24');
INSERT INTO Questionnaire(idQ, titre, auteur, dateDebut, dateFin) VALUES
  ('Q000002', 'IFT187 - Semaine 1 : Les colles du prof', 'Christina Khnaisser', '2015-08-31', '2015-09-07');


-- x0x "Insertions dans Question"
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (1, 'Q000001', 'Programme d’étude', 'QCMO', 't');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (2, 'Q000001', 'Prenom', 'QO', 't');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (3, 'Q000001', 'matricule', 'QO', 't');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (4, 'Q000001', 'Courriel', 'QO', 't');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (5, 'Q000001', 'Numéro du groupe', 'QCM', 't');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (6, 'Q000001', 'Formation antérieure', 'QCMO', 't');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (7, 'Q000001', 'Q1 - Quel est le lien entre ce cours et votre programme?', 'QCM', 'f');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (8, 'Q000001', 'Q2 - Puis-je réserver un billet d’avion pour aller voir ma famille le 19 décembre?', 'QCM', 'f');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire) VALUES
  (9, 'Q000001', 'Q3 - Connaissez-vous le langage SQL?', 'QCM', 't');
INSERT INTO Question (noQ, idQ, libelle, typeQ, obligatoire)VALUES
  (1, 'Q000002', 'Question 1 - Évaluation', 'QCM', 't');
INSERT INTO Question(noQ, idQ, libelle, typeQ, obligatoire)VALUES
  (2, 'Q000002', 'Question 2 - Évaluation', 'QCM', 't');


-- x0x "Insertions dans ChoixQCM"
    -- Choix de la question 1 Numéro du groupe
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 1, 1, 'B.Sc. en informatique');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 1, 2, 'B.Sc. en informatique de gestion');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 1, 3, 'B.Sc. en géomatique');
    -- Choix de la question 5 Numéro du groupe
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 5, 1, '1'); -- groupe 1
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 5, 2, '2'); -- groupe 2
    -- Choix de la question 6 Formation antérieure
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 6, 1, 'DEC en technique en informatique');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 6, 2, 'DEC en science informatique et mathématiques');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 6, 3, 'DEC en sciences de la nature');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 6, 4, 'DEC en histoire et civilisation');
    -- Choix de la question 7
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 7, 1, 'Cours obligatoire préalable à d’autres cours obligatoires');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 7, 2, 'Cours libre');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 7, 3, 'Cours à option');
    -- Choix de la question 8
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 8, 1, 'Oui');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 8, 2, 'Non');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 8, 3, 'Je prends la chance');
    -- Choix de la question 8
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 9, 1, 'Oui');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000001', 9, 2, 'Non');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000002', 1, 1, 'Choix 1');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000002', 1, 2, 'Choix 2');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000002', 1, 3, 'Choix 3');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000002', 1, 4, 'Choix 4');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description)VALUES
 ('Q000002', 2, 1, 'Choix 1');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000002', 2, 2, 'Choix 2');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000002', 2, 3, 'Choix 3');
INSERT INTO ChoixQCM (idQ, noQ, noChoix, description) VALUES
 ('Q000002', 2, 4, 'Choix 4');


-- x0x "Insertions dans Repondant" ;
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('01957627', 'Madi', 'Adelle', 'Adelle.Madi@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('01897627', 'Beau', 'Coeur', 'Coeur.Beau@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('02087627', 'Encore', 'Jean', 'Jean.Encore@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('02241489', 'Menard', 'Mario', 'Menard.Mario@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('02383055', 'Parisien', 'Cyril', 'Cyril.Parisien@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('21212121', 'Poulin-Nguyen', 'Aline', 'Aline.Poulin.Nguyen@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('03241489', 'Comet', 'Beatrice', 'Beatrice.Comet@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('04383055', 'Melon', 'Paul', 'Paul.Melon@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('55212121', 'Visage', 'Joli', 'Joli.Visage@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('10212121', 'Magie', 'Laura T.', 'Laura.T.Magie@usherbrooke.ca');
INSERT INTO Repondant (matricule, nom, prenom, courriel) VALUES
  ('09957627','Madi','Adelle','Adelle.Madi2@usherbrooke.ca');


-- x0x "Insertions dans Formulaire"
INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '01957627', '2015-08-18');
INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '01897627', '2015-08-18');
INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '02087627', '2015-08-19');
INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '02241489', '2015-08-20');
INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '02383055', '2015-08-21');
 INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '21212121', '2015-08-21');
 INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '03241489', '2015-08-22');
 INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '04383055', '2015-08-23');
 INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '55212121', '2015-08-28');
 INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000001', '10212121', '2015-08-29');
INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000002', '01957627', '2015-09-01');
INSERT INTO Formulaire (idQ, matricule, dateReponse) VALUES
 ('Q000002', '01897627', '2015-09-02');


-- x0x "Insertions dans Reponse"
-- Les réponses de 01957627
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 1);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 2);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 3);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 4);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 5);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 6);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 7);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 8);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01957627', 9);
 -- Les réponses de 01897627
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 1);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 2);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 3);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 4);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 5);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 6);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 7);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 8);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000001', '01897627', 9);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000002', '01957627', 1);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000002', '01957627', 2);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000002', '01897627', 1);
INSERT INTO Reponse (idQ, matricule, noQ) VALUES
 ('Q000002', '01897627', 2);

-- x0x "Insertions dans RO"

INSERT INTO RO (idQ, matricule, noQ, texteReponse) VALUES
  ('Q000001', '01957627', 2, 'Adelle');
INSERT INTO RO (idQ, matricule, noQ, texteReponse) VALUES
  ('Q000001', '01957627', 3, '01957627');
INSERT INTO RO (idQ, matricule, noQ, texteReponse) VALUES
  ('Q000001', '01957627', 4, 'Adelle.Madi@usherbrooke.ca');
--

INSERT INTO RO (idQ, matricule, noQ, texteReponse) VALUES
  ('Q000001', '01897627', 1, 'Géomatique appliquée à l’environnement');
INSERT INTO RO (idQ, matricule, noQ, texteReponse) VALUES
  ('Q000001', '01897627', 3, '01897627');
INSERT INTO RO (idQ, matricule, noQ, texteReponse) VALUES
  ('Q000001', '01897627', 4, 'Beau.Coeur@usherbrooke.ca');

-- x0x "Insertions dans RCM"
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000001', '01957627', 1, 1);
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000001', '01957627', 5, 1);
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000001', '01957627', 6, 3);
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000001', '01957627', 7, 3);
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000001', '01957627', 8, 1);
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000001', '01957627', 9, 1);
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000002', '01957627', 1, 4);
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000002', '01957627', 2, 3);
INSERT INTO RCM (idQ, matricule, noQ, noChoix)VALUES
  ('Q000002', '01897627', 1, 1);
INSERT INTO RCM (idQ, matricule, noQ, noChoix) VALUES
  ('Q000002', '01897627', 2, 4);


/*
============================================================================== Z
.Contributeurs :
  (CK01) christina.khnaisser@usherbrooke.ca,
  (LL01) luc.lavoie@usherbrooke.ca

.Adresse, droits d’auteur et copyright :
  Groupe Groupe Μῆτις (Métis)
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
-- fin de Sondage_jdd-val.sql
============================================================================== Z
*/
