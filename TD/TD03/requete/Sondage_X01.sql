/*
Objectif
  Calculer le nombre de répondants par questionnaire.
Prédicat
  Le questionnaire "idQ" de titre "titre" conçu par "auteur" a été rempli par
  "nbRep" répondants.
Présentation
  Trier en ordre de numéro de questionnaire.
Notes
*  Seuls les questionnaires ayant des répondants sont pris en compte.
*/
-- X01a
WITH
  NBR AS
  (
    SELECT idQ, COUNT(*) AS nbRep
    FROM Formulaire
    GROUP BY idQ
  )
SELECT idQ, titre, auteur, nbRep
FROM Questionnaire JOIN NBR USING(idQ)
ORDER BY idQ
;
