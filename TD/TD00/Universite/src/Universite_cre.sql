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
Création des domaines et des tables du schéma Evaluation.
Les définitions suivantes sont établies dans le contexte de l’Université de Samarcande (UdeS).

Notes de mise en oeuvre
(a) aucune.
-- =========================================================================== B
*/
--
-- Définition des sous-types
--
create domain SigleCours
  char(6)
  constraint sigleCours_check check(value similar to '[A-Z]{3}[0-9]{3}');
comment on domain SigleCours is
  $$Un sigle de cours a pour vocation d’identifier uniquement une activité de formation.$$;
comment on constraint sigleCours_check on domain SigleCours is
  $$Un signe est composé de trois lettres majuscules suivies de trois chiffres.$$;

create domain Matricule
  -- Un matricule a pour vocation d’identifier uniquement un étudiant.
  char(8)
  check(value similar to '[0-9]{8}');
comment on domain Matricule is
 $$Un matricule est composé d’exactement huit chiffres.$$;

create domain TypeEval
  -- Un code de type d’évaluation a pour vocation d’identifier uniquement un type d’évaluation.
  char(2)
  check(value similar to '[A-Z]{2}');
comment on domain TypeEval is
  $$Un code de type d’évaluation composé de deux lettre en majuscules.$$;

create domain Note
  integer
  check (VALUE between 0 and 100);
comment on domain Note is
  $$ Une note est un entier compris entre 0 et 100 inclusivement.$$;
-- Une note est une mesure d’évaluation d’un travail remis dans le cadre d’une activité de formation.

-- TODO 2026-01-13 (CK) : la contraintes est incomplète, elle ne vérifie pas l'année.
create domain Trimestre
  -- Les trimestres sont encodés en suffixant le chiffre du trimestre à
  -- une année postérieure à 1927 (année de fondation de l’UdeS).
  -- Chiffre associé au trimestre : hiver -> 1, été -> 2, automne -> 3.
  char(5)
  check(VALUE similar to '[0-9]{4}[1-3]{1}');
--
-- Définition des tables
--
create table Activite
(
  sigle SigleCours not null,
  titre varchar    not null,
  constraint Activite_cc0 primary key (sigle)
);

create table Etudiant
(
  matricule Matricule not null,
  nom       varchar   not null,
  adresse   varchar   not null,
  constraint Etudiant_cc0 primary key (matricule)
);

create table TypeEvaluation
(
  code        TypeEval not null,
  description varchar  not null,
  constraint TypeEvaluation_cc0 primary key (code)
);

create table Resultat
(
  matricule Matricule  not null,
  TE        TypeEval   not null,
  activite  SigleCours not null,
  trimestre Trimestre  not null,
  note      Note       not null,
  constraint Resultat_cc0 primary key (matricule, activite, TE, trimestre),
  constraint Resultat_cr0 foreign key (matricule) references Etudiant (matricule),
  constraint Resultat_cr1 foreign key (activite) references Activite (sigle),
  constraint Resultat_cr2 foreign key (TE) references TypeEvaluation (code)
);
--
/*
-- =========================================================================== Z
Contributeurs :
  (CK) Christina.Khnaisser@USherbrooke.ca
  (LL) Luc.Lavoie@USherbrooke.ca

Tâches projetées :
TODO 2026-01-11 (CK) :
  * Réviser le code.
  * Documenter les prédicats.
  * Documenter l’évolution du composant.

Tâches réalisées :
  2026-01-11 (CK) : Création

Référence :
  [TMR_02] Notes de cours
  [PG-COMMENT] https://www.postgresql.org/docs/current/sql-comment.html
-- -----------------------------------------------------------------------------
-- Fin de Universite_cre.sql
-- =========================================================================== Z
*/
