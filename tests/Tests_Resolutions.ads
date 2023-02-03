with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with tests;                 use tests;

package tests_Resolutions is

   -- tests résolution Sudoku
   function test_Resolution_Grille_1 return Boolean;
   function test_Resolution_Grille_2 return Boolean;
   function test_Resolution_Grille_3 return Boolean;
   function test_Resolution_Grille_4 return Boolean;
   function test_Resolution_Grille_5 return Boolean;
   function test_Resolution_Grille_6 return Boolean;
   function test_Resolution_Grille_7 return Boolean;
   function test_Resolution_Grille_8 return Boolean;
   function test_Resolution_Grille_9 return Boolean;

   les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((test_Resolution_Grille_1'Access,
       To_Unbounded_String ("echec de resolution de la grille 1")),
      (test_Resolution_Grille_2'Access,
       To_Unbounded_String ("echec de resolution de la grille 2")),
      (test_Resolution_Grille_3'Access,
       To_Unbounded_String ("echec de resolution de la grille 3")),
      (test_Resolution_Grille_4'Access,
       To_Unbounded_String ("echec de resolution de la grille 4")),
     (test_Resolution_Grille_5'Access,
       To_Unbounded_String ("echec de resolution de la grille 5")),
      (test_Resolution_Grille_6'Access,
       To_Unbounded_String ("echec de resolution de la grille 6")),
      (test_Resolution_Grille_7'Access,
       To_Unbounded_String ("echec de resolution de la grille 7")),
      (test_Resolution_Grille_8'Access,
       To_Unbounded_String ("echec de resolution de la grille 8")),
      (test_Resolution_Grille_9'Access,
       To_Unbounded_String ("echec de resolution de la grille 9")));

   resultats : array (les_Tests'Range) of Boolean;

end tests_Resolutions;
