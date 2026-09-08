/*
============================================================================== A
Produit : CoFELI.Exemple.Universite
Responsable : Christina.Khnaisser@usherbrooke.ca
Version : 1.0.0a (2026-01-11)
Statut : applicable
Encodage : UTF-8, sans BOM; fin de ligne simple (LF)
Plateformes : ISO, PostgreSQL
============================================================================== A
*/

/*
-- =========================================================================== B
Suppression des tables du schéma Evaluation.

Notes de mise en oeuvre
(a) L'ordre n'est pas important lorsque l'opération CASCADE est spécifiée.
-- =========================================================================== B
*/

drop table Activite cascade;
drop table Etudiant cascade;
drop table TypeEvaluation cascade;
drop table Resultat cascade;

drop domain SigleCours;
drop domain Matricule;
drop domain TypeEval;
drop domain Note;
drop domain Trimestre;

/*
-- =========================================================================== Z
Contributeurs :
  (CK01) christina.khnaisser@usherbrooke.ca
  (LL01) luc.lavoie@usherbrooke.ca

Tâches projetées :
NIL

Tâches réalisées :
2018-09-01 (LL01) : Suppression
  * DROP DOMAIN SiglecCours, Matricule, TypeEval, Note, Trimestre.
2013-09-03 (LL01) : Suppression
  * DROP TABLE Activite, TypeEvaluation, Etudiant, Resultat.

Références :
  TMR_02
-- -----------------------------------------------------------------------------
-- fin de Universite_drop.sql
-- =========================================================================== Z
*/
