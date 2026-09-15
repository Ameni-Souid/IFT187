/*
============================================================================== A
Produit : CoFELI:Exemple/Sondage
Trimestre : 2026-3
Composant : Sondage_ini.sql
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.4 à 16.2
Responsables : christina.khnaisser@usherbrooke.ca ; luc.lavoie@usherbrooke.ca
Version : 0.1.1b
Statut : applicable
============================================================================== A
*/

/*
============================================================================== B
Création du schéma "Sondage" correspondant au modèle Sondage documenté dans [epp].

Le schéma permet d’organiser un modèle de données spécifié en SQL en sous-modèles.
Chaque schéma est associé à un espace de nommage propre (une portée) et peut
comprendre tout composant définissable dans une base de données.

La définition des schémas fait intervenir les trois commandes usuelles
(CREATE, ALTER et DROP) et on peut faire de son espace de nommage
la portée courante grâce à l’instruction SET SCHEMA.
On réfère à un composant d’un autre schéma en le préfixant l’identifiant du composant
du nom du schéma suivi d’un point ("Sondage".Courriel).

Au schéma, on peut également associer des contraintes d’accès applicable à l’ensemble
de ses composants (certains composants pouvant se voir associer des contraintes particulières).

Toute base de données comprend au moins un schéma utilisé à défaut
(son identifiant varie d’un dialecte à un autre, en PostgreSQL c’est "public").
En pratique, on recommande de n’utiliser ce schéma que pour les composants
ne nécessitant aucun contrôle d’accès.

Bien que prescrit par la norme ISO 9075:2016, le schéma n’est pas disponible dans
tous les dialectes. Certains l’ignorent complètement (SQLite), d’autres le traitent
comme un synonyme lexical de DATABASE (MariaDB), d’autres l’ont amalgamé à la notion
d’utilisateurs (Oracle). Heureusement, plusieurs le mettent en oeuvre correctement
(PostgreSQL, Tansact-SQL, DB2 et TeraData notamment).

Le présent script est rendu ré-entrant grâce à la clause IF EXISTS.
Bien que fort utile, elle n’a cependant pas (encore) été intégrée au standard ISO 9075.
Finalement, en PostgreSQL, la dénotation du schéma utilisée par la commande SET
prend la forme d’un texte ('Sondage') au lieu d’un identifiant ("Sondage").
============================================================================== B
*/

DROP SCHEMA IF EXISTS "Sondage" CASCADE ;
CREATE SCHEMA "Sondage" ;
SET SCHEMA 'Sondage' ;

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
  * 2024-05-12 (LL) : Extraction de Sondage_cre.sql

.Références :
  * [epp] CoFELI:Exemples/Sondage/Sondage_DDV.pdf
  * [std] Akademia:Modules/BD190-STD-SQL-01_NDC.pdf

--------------------------------------------------------------------------------
-- fin de Sondage_ini.sql
============================================================================== Z
*/