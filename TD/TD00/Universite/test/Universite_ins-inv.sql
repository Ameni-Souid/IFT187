/*
============================================================================== A
Produit : CoFELI.Exemple.Universite
Responsable : Christina.Khnaisser@usherbrooke.ca
Version : 1.0.0a (2026-01-11)
Statut : applicable
Encodage : UTF-8, sans BOM; fin de ligne simple (LF)
Plateformes : ISO, PostgreSQL...
============================================================================== A
*/

/*
-- =========================================================================== B
Exemples de données INVALIDES pour le schéma Evaluation.
Pour plus d’information, voir le module TMR_02.
-- =========================================================================== B
*/

--
-- TypeEvaluation : données INVALIDES
--
insert into TypeEvaluation
  values ('tev', 'trois lettres - ECHEC ATTENDU');
insert into TypeEvaluation
  values ('i8', 'chiffres refusés - ECHEC ATTENDU');

--
-- Activite : données INVALIDES
--
insert into Activite
  values ('IG8401', 'Gestion de projets'); -- sigle mal formé
insert into Activite
  values ('GMQ1N3', 'Géopositionnement'); -- sigle mal formé

--
-- Etudiant : données INVALIDES
--
insert into Etudiant
  values ('A0132', 'Sergeï', 'Chandler - matricule mal formé');
insert into Etudiant
  values ('10132', 'Paul', 'Montréal - matricule mal formé');

--
-- Resultat : données INVALIDES
--
insert into Resultat
  values ('99912354', 'XX', 'IFT159', '20123', 52); -- type d’évaluation inconnu
insert into Resultat
  values ('99912354', 'FI', 'IFT159', '19003', 52); -- année antérieure à 1927
insert into Resultat
  values ('99912354', 'FI', 'IFT159', '20124', 52); -- il n'y a pas de 4e trimestre
insert into Resultat
  values ('99912354', 'FI', 'IFT159', '20123', 101); -- note au delà de 100


/*
-- =========================================================================== Z
Contributeurs :
  (CK01) christina.khnaisser@usherbrooke.ca,
  (LL01) luc.lavoie@usherbrooke.ca

Tâches projetées :
NIL

Tâches réalisées :
2013-09-03 (LL01) : Création de cas de tests minimaux
  * un test par contrainte

Références :
  TMR_02
-- -----------------------------------------------------------------------------
-- fin de Universite_ins-inv.sql
-- =========================================================================== Z
*/
