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
Test unitaires pour les domaines.
-- =========================================================================== B
*/
--
-- Test domaine Trimestre
-- Test valide
select '20261'::evaluation.trimestre;
-- Test invalides
-- Années < 1927
select '18001'::evaluation.trimestre;
-- chiffre du trimestre invalide
select '20264'::evaluation.trimestre;
--
/*
-- =========================================================================== Z
Contributeurs :
  (CK) Christina.Khnaisser@USherbrooke.ca
  (LL) Luc.Lavoie@USherbrooke.ca

Tâches projetées :

Tâches réalisées :
  2026-01-14 (CK) : Création

Référence :
  TMR_02
-- -----------------------------------------------------------------------------
-- Fin de domain_test.sql
-- =========================================================================== Z
*/
