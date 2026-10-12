/*
============================================================================== B
                                      Y02
                              Définir des fonctions.
--------------------------------------------------------------------------------
Choix_nb (idQ, noQ) : INTEGER ;
Retourne le nombre de choix de la question noQ du questionnaire idQ.

Choix_corrects (idQ, noQ) : BOOLEAN ;
Retourne vrai si et seulement si les choix de la question noQ du questionnaire idQ
sont numérotés de 1 à n, où n est le nombre de choix de la question
(il s’agit de vérifier les valeurs des attributs noChoix idoines).

Réponse_legitime (idQ, noQ, matR) : BOOLEAN ;
Retourner vrai si et seulement si la réponse respecte les règles suivantes :

- pas de RCM et RO simultanément;
- QCM  -> RCM seulement;
- QO   -> RO seulement;
- QCMO -> RCM ou RO;
- numéro de choix légitime pour une RCM;
- réponse présente si la question est obligatoire;
- saisie comprise entre ouverture et fermeture.
============================================================================== B
*/

