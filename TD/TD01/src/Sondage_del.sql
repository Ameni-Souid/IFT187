/*
============================================================================== A
Produit : CoFELI:Exemple/Sondage
Trimestre : 2026-3
Composant : Sondage_del.sql (ébauche)
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.4 à 16.2
Responsables : christina.khnaisser@usherbrooke.ca ; luc.lavoie@usherbrooke.ca
Version : 0.1.1a
Statut : travail en cours
============================================================================== A
*/

/*
============================================================================== B
   Suppression des données du schéma Sondage documenté dans [epp].
============================================================================== B
*/

-- Au choix, on peut spécifier un schéma autre que celui établi par défaut,
-- par exemple le schéma "Sondage". Noter le passage des guillemets aux
-- apostrophes imposé par l’instruction SET.

SET SCHEMA 'Sondage' ;

DELETE FROM Questionnaire ;

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
-- fin de Sondage_del.sql
============================================================================== Z
*/
