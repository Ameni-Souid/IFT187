/*
============================================================================== A
Produit : CoFELI:Exemple/Sondage
Trimestre : 2026-3
Composant : Sondage_del.sql (solution)
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.4 à 16.2
Responsables : ameni.souid@usherbrooke.ca ; christina.khnaisser@usherbrooke.ca ; luc.lavoie@usherbrooke.ca
Version : 0.1.1a
Statut : solution préliminaire
============================================================================== A
*/

/*
============================================================================== B
   Suppression des données du schéma Sondage documenté dans [epp].
============================================================================== B
*/

SET SCHEMA 'Sondage' ;

DELETE FROM RO;
DELETE FROM RCM;
DELETE FROM Reponse;
DELETE FROM Formulaire;
DELETE FROM Repondant;
DELETE FROM ChoixQCM;
DELETE FROM Question;
DELETE FROM Questionnaire;

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
-- fin de Sondage_del.sql
============================================================================== Z
*/
