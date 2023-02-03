with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with tests;                 use tests;

package tests_TAD_Coordonnee is

   -- tests TAD Coordonnees
   function test_Coordonnees_P1 return Boolean;
   function test_Coordonnees_P2 return Boolean;
   function test_Coordonnees_P3a return Boolean;
   function test_Coordonnees_P3b return Boolean;
   function test_Coordonnees_P3c return Boolean;
   function test_Coordonnees_P3d return Boolean;
   function test_Coordonnees_P3e return Boolean;
   function test_Coordonnees_P3f return Boolean;
   function test_Coordonnees_P3g return Boolean;
   function test_Coordonnees_P3h return Boolean;
   function test_Coordonnees_P3i return Boolean;
   function test_Coordonnees_P3 return Boolean;
   function test_Coordonnees_P4 return Boolean;

   les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((test_Coordonnees_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 Coordonnees")),
      (test_Coordonnees_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 Coordonnees")),
      (test_Coordonnees_P3a'Access,
       To_Unbounded_String ("echec de la propriete 3a Coordonnees")),
      (test_Coordonnees_P3b'Access,
       To_Unbounded_String ("echec de la propriete 3b Coordonnees")),
      (test_Coordonnees_P3c'Access,
       To_Unbounded_String ("echec de la propriete 3c Coordonnees")),
      (test_Coordonnees_P3d'Access,
       To_Unbounded_String ("echec de la propriete 3d Coordonnees")),
      (test_Coordonnees_P3e'Access,
       To_Unbounded_String ("echec de la propriete 3e Coordonnees")),
      (test_Coordonnees_P3f'Access,
       To_Unbounded_String ("echec de la propriete 3f Coordonnees")),
      (test_Coordonnees_P3g'Access,
       To_Unbounded_String ("echec de la propriete 3g Coordonnees")),
      (test_Coordonnees_P3h'Access,
       To_Unbounded_String ("echec de la propriete 3h Coordonnees")),
      (test_Coordonnees_P3h'Access,
       To_Unbounded_String ("echec de la propriete 3i Coordonnees")),
      (test_Coordonnees_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 Coordonnees")),
      (test_Coordonnees_P4'Access,
       To_Unbounded_String ("echec de la propriete 4 Coordonnees")));

   resultats : array (les_Tests'Range) of Boolean;

end tests_TAD_Coordonnee;
