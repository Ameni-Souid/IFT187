/*
============================================================================== A
Produit : CoFELI.Exemple.Universite
Responsable : Christina.Khnaisser@usherbrooke.ca
Version : 1.0.0a (2026-01-15)
Statut : applicable
Encodage : UTF-8, sans BOM; fin de ligne simple (LF)
Plateformes : ISO, PostgreSQL
============================================================================== A
*/
/*
-- =========================================================================== B
Exemples de données VALIDES pour le schéma Evaluation.
Pour plus d’information, voir le module TMR_02.
-- =========================================================================== B
*/
--
--
-- Etudiant : données invalides
--
insert into Etudiant
  values ('15113150', 'Paul', 'ᐳᕕᕐᓂᑐᖅ');
insert into Etudiant
  values ('15112354', 'Éliane', 'Blanc-Sablon');
insert into Etudiant
  values ('15113870', 'Mohamed', 'Tadoussac');
insert into Etudiant
  values ('15110132', 'Sergeï', 'Chandler');
-- Etudiant : données invalides
--
-- Resultat : données valides
--
insert into Resultat
  values ('15113150', 'TP', 'IFT187', '20133', 80);
insert into Resultat
  values ('15112354', 'FI', 'IFT187', '20123', 78);
insert into Resultat
  values ('15113150', 'TP', 'IFT159', '20133', 75);
insert into Resultat
  values ('15112354', 'FI', 'GMQ103', '20123', 85);
insert into Resultat
  values ('15110132', 'IN', 'IMN117', '20123', 90);
insert into Resultat
  values ('15110132', 'IN', 'IFT187', '20133', 45);
insert into Resultat
  values ('15112354', 'FI', 'IFT159', '20123', 52);
--
--
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
