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
Exemples de données valides pour le schéma Evaluation.
Pour plus d’information, voir le module TMR_02.
-- =========================================================================== B
*/

--
-- TypeEvaluation
--
insert into TypeEvaluation
  values ('FI', 'Examen final');
insert into TypeEvaluation
  values ('IN', 'Examen intra');
insert into TypeEvaluation
  values ('TP', 'Travail pratique');
insert into TypeEvaluation
  values ('PR', 'Projet');
--
-- Activite
--
insert into Activite
  values ('IFT159', 'Analyse et programmation');
insert into Activite
  values ('IFT187', 'Éléments de bases de données');
insert into Activite
  values ('IMN117', 'Acquisition des médias numériques');
insert into Activite
  values ('IGE401', 'Gestion de projets');
insert into Activite
  values ('GMQ103', 'Géopositionnement');
--
/*
-- =========================================================================== Z
Contributeurs :
  (CK01) christina.khnaisser@usherbrooke.ca,
  (LL01) luc.lavoie@usherbrooke.ca

Tâches projetées :
NIL

Tâches réalisées :
2026-01-15 (CK01) : Initialisation
  * Insertion des données de l’exemple fourni dans TMR_02.

Références :
  TMR_02
-- -----------------------------------------------------------------------------
-- fin de Universite_ins.sql
-- =========================================================================== Z
*/
