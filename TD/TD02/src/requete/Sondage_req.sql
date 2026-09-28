/*
============================================================================== A
Produit : CoFELI:Exemple/Sondage
Trimestre : 2026-3
Composant : Sondage_req.sql (ébauche)
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.4 à 16.2
Responsables : ameni.souid@usherbrooke.ca ; christina.khnaisser@usherbrooke.ca ; luc.lavoie@usherbrooke.ca
Version : 0.1.1a
Statut : travail en cours
============================================================================== A
*/

/*
==============================================================================
R01
Quelles sont les questions ouvertes ?
Donner le numéro du questionnaire, le numéro de question et le libellé.
==============================================================================
*/
SELECT idQ, noQ, libelle
FROM Question
WHERE typeQ = 'QO'
;

/*
==============================================================================
R02
Quelles sont les questions à choix multiples du questionnaire Q000001 ?
Donner le numéro de question et le libellé.
==============================================================================
*/


/*
==============================================================================
R03
Combien y a-t-il de questions dans le questionnaire Q000001 ?
Donner le nombre.
==============================================================================
*/
SELECT COUNT(*)
FROM Question
WHERE idQ = 'Q000001'
;

/*
==============================================================================
R04.
Combien y a-t-il eu de questionnaires saisissables entre le 18 et le 23 aout 2015 ?
Donner le nombre.
==============================================================================
*/


/*
==============================================================================
R05.
Quel est l’inventaire des réponses à la question 6 du questionnaire Q000001 ?
Donner la matricule du répondant et le texte des réponses.
==============================================================================
*/


/*
==============================================================================
R06.
Quel est l’inventaire des réponses à la question 8 du questionnaire Q000001 différentes de « Non » ?
Donner la matricule du répondant et le texte des réponses.
==============================================================================
*/


/*
==============================================================================
R07.
Quels sont les répondants dont les formulaires ont été saisis à une date postérieure
à la date limite du questionnaire correspondant ?
Donner la matricule, la date de saisie, le numéro du questionnaire et la date
limite prescrite par le questionnaire.
==============================================================================
*/


/*
==============================================================================
R08.
Quels sont les répondants qui ont répondu aux deux questionnaires Q000001 et Q000002 ?
Donner le nom, le prénom et le matricule.
==============================================================================
*/


/*
==============================================================================
R09.
Quels sont les répondants qui sont des homonymes (même nom et même prénom) ?
Donner le nom, le prénom ainsi que le matricule et le courriel de chacun.
==============================================================================
*/


/*
==============================================================================
R10.
Sur la base des réponses au questionnaire Q000001, calculer le ratio de répondants
du groupe 01 par rapport à ceux du groupe 02 ?
==============================================================================
*/


/*
==============================================================================
R11.
Quel est le pourcentage des répondants ayant une formation antérieure en informatique
et qui ont répondu « Oui » à la question « Q3 — Connaissez-vous le langage SQL ? »
du questionnaire Q000001 ? Donner le nom, le prénom, et la formation antérieure du répondant.
==============================================================================
*/


/*
==============================================================================
R12.
Quelle est la période durant laquelle il y a eu le plus grand nombre de répondants :
entre le 15 et le 20 aout 2015 ou entre le 20 et 28 aout 2015 ?
==============================================================================
*/


/*
==============================================================================
R13.
En prenant en compte le barème suivant pour les questions 1 et 2 du questionnaire Q000002,
Dresser la liste des répondants avec le résultat obtenu (le résultat est la somme des notes obtenues aux questions 1 et 2).
Ajouter la mention « Réussi » si le résultat est au moins 10 et « Échec » sinon.
Donner le nom, le prénom, le matricule, le résultat et la mention.

Barème
Question  Choix   Note
1         1	      -5
1	        2	       0
1	        3	       5
1	        4	      10
2	        1	       0
2	        2	      10
2	        3	       5
2	        4	       0
==============================================================================
*/

/*
============================================================================== Z
.Contributeurs :
  (BG) Bernadette.Guérard@USherbrooke.ca
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
  * 2015-08-20 (SF) : Création initiale

.Références :
  * [epp] CoFELI:Exemples/Sondage/Sondage_DDV.pdf
  * [std] Akademia:Modules/BD190-STD-SQL-01_NDC.pdf

--------------------------------------------------------------------------------
-- fin de Exemples/Sondage/Sondage_req.sql
============================================================================== Z
*/
