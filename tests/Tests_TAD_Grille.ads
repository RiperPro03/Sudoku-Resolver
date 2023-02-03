with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with tests;                 use tests;

package tests_TAD_Grille is

   -- tests TAD GrillesSudoku
   function test_Grille_P1 return Boolean;
   function test_Grille_P2 return Boolean;
   function test_Grille_P3 return Boolean;
   function test_Grille_P4 return Boolean;
   function test_Grille_P5 return Boolean;
   function test_Grille_P6 return Boolean;
   function test_Grille_P7a return Boolean;
   function test_Grille_P7b return Boolean;
   function test_Grille_P8 return Boolean;
   function test_Grille_P9 return Boolean;
   function test_Grille_P10a return Boolean;
   function test_Grille_P10b return Boolean;
   function test_Grille_P11 return Boolean;
   function test_Grille_P12 return Boolean;
   function test_Grille_P13 return Boolean;
   function test_Grille_P14a return Boolean;
   function test_Grille_P14b return Boolean;
   function test_Grille_P15 return Boolean;
   function test_Grille_P16 return Boolean;
   function test_Grille_P17 return Boolean;
   function test_Grille_P18 return Boolean;
   function test_Grille_P19 return Boolean;
   function test_Grille_Exception1 return Boolean;
   function test_Grille_Exception2 return Boolean;
   function test_Grille_Exception3 return Boolean;

   les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((test_Grille_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 Grille")),
      (test_Grille_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 Grille")),
      (test_Grille_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 Grille")),
      (test_Grille_P4'Access,
       To_Unbounded_String ("echec de la propriete 4 Grille")),
      (test_Grille_P5'Access,
       To_Unbounded_String ("echec de la propriete 5 Grille")),
      (test_Grille_P6'Access,
       To_Unbounded_String ("echec de la propriete 6 Grille")),
      (test_Grille_P7a'Access,
       To_Unbounded_String ("echec de la propriete 7a Grille")),
      (test_Grille_P7b'Access,
       To_Unbounded_String ("echec de la propriete 7b Grille")),
      (test_Grille_P8'Access,
       To_Unbounded_String ("echec de la propriete 8 Grille")),
      (test_Grille_P9'Access,
       To_Unbounded_String ("echec de la propriete 9 Grille")),
      (test_Grille_P10a'Access,
       To_Unbounded_String ("echec de la propriete 10a Grille")),
      (test_Grille_P10b'Access,
       To_Unbounded_String ("echec de la propriete 10b Grille")),
      (test_Grille_P11'Access,
       To_Unbounded_String ("echec de la propriete 11 Grille")),
      (test_Grille_P12'Access,
       To_Unbounded_String ("echec de la propriete 12 Grille")),
      (test_Grille_P13'Access,
       To_Unbounded_String ("echec de la propriete 13 Grille")),
      (test_Grille_P14a'Access,
       To_Unbounded_String ("echec de la propriete 14a Grille")),
      (test_Grille_P14b'Access,
       To_Unbounded_String ("echec de la propriete 14b Grille")),
      (test_Grille_P15'Access,
       To_Unbounded_String ("echec de la propriete 15 Grille")),
      (test_Grille_P16'Access,
       To_Unbounded_String ("echec de la propriete 16 Grille")),
      (test_Grille_P17'Access,
       To_Unbounded_String ("echec de la propriete 17 Grille")),
      (test_Grille_P18'Access,
       To_Unbounded_String ("echec de la propriete 18 Grille")),
      (test_Grille_P19'Access,
       To_Unbounded_String ("echec de la propriete 19 Grille")),
      (test_Grille_Exception1'Access,
       To_Unbounded_String ("echec de l'exception 1 Grille")),
      (test_Grille_Exception2'Access,
       To_Unbounded_String ("echec de l'exception 2 Grille")),
      (test_Grille_Exception3'Access,
       To_Unbounded_String ("echec de l'exception 3 Grille")));

   resultats : array (les_Tests'Range) of Boolean;

end tests_TAD_Grille;
