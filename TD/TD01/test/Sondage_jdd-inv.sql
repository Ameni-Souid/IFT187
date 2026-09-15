/*
============================================================================== A
Produit : CoFELI:Exemple/Sondage
Trimestre : 2026-3
Composant : Sondage_jdd-inv.sql (ébauche)
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.4 à 16.2
Responsables : christina.khnaisser@usherbrooke.ca ; luc.lavoie@usherbrooke.ca
Version : 0.1.1a
Statut : travail en cours
============================================================================== A
*/

/*
============================================================================== B
Les préfixes de ligne "-- xox" sont destinés à être remplacés par des
instructions d’écriture lorsque le fichier est exécuté sous forme de script.
Par exemple,
  - "prompt " sous SQL*Plus (Oracle),
  - "\echo  " sous psql (PostgreSQL).
============================================================================== B
*/

-- Au choix, on peut spécifier un schéma autre que celui établi par défaut,
-- par exemple le schéma "Sondage". Noter le passage des guillemets aux
-- apostrophes imposé par l’instruction SET.

SET SCHEMA 'Sondage' ;

-- x0x "=====================================================================" ;
-- x0x "Insertions de données invalides" ;
-- x0x "=====================================================================" ;

-- x0x "Insertions dans Questionnaire"
  -- Numéro du questionnaire ne peut pas dépasser 7 caractères
INSERT INTO Questionnaire(idQ, titre, auteur, dateDebut, dateFin) VALUES
  ('Q000002xx', 'IFT187 - Semaine 1 : Les colles du prof', 'Christina Khnaisser', '2015-08-31', '2015-09-07');
  -- Date de fin est plus petite que la date de début
INSERT INTO Questionnaire(idQ, titre, auteur, dateDebut, dateFin) VALUES
  ('Q000001', 'IFT187 - Semaine 0 : Les colles du prof', 'Luc Lavoie', '2015-08-24', '2015-08-18');
  -- Numéro du questionnaire pré-existe (si Sondage_jdd-val.sql a été exécuté au préalable)
INSERT INTO Questionnaire(idQ, titre, auteur, dateDebut, dateFin) VALUES
  ('Q000001', 'IFT187 - Semaine 0 : Les colles du prof', 'Luc Lavoie', '2015-08-18', '2015-08-24');

--
-- À compléter
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
-- fin de Sondage_jdd-inv.sql
============================================================================== Z
*/
