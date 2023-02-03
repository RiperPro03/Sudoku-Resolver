with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with tests;                 use tests;

package tests_TAD_Ensemble is

   -- tests TAD Ensemble
   function test_Ensemble_P1 return Boolean;
   function test_Ensemble_P2 return Boolean;
   function test_Ensemble_P3 return Boolean;
   function test_Ensemble_P4 return Boolean;
   function test_Ensemble_P5a return Boolean;
   function test_Ensemble_P5b return Boolean;
   function test_Ensemble_P6 return Boolean;
   function test_Ensemble_P7a return Boolean;
   function test_Ensemble_P7b return Boolean;
   function test_Ensemble_P8 return Boolean;
   function test_Ensemble_Exception1 return Boolean;
   function test_Ensemble_Exception2 return Boolean;

   les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((test_Ensemble_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 Ensemble")),
      (test_Ensemble_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 Ensemble")),
      (test_Ensemble_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 Ensemble")),
      (test_Ensemble_P4'Access,
       To_Unbounded_String ("echec de la propriete 4 Ensemble")),
      (test_Ensemble_P5a'Access,
       To_Unbounded_String ("echec de la propriete 5a Ensemble")),
      (test_Ensemble_P5b'Access,
       To_Unbounded_String ("echec de la propriete 5b Ensemble")),
      (test_Ensemble_P6'Access,
       To_Unbounded_String ("echec de la propriete 6 Ensemble")),
      (test_Ensemble_P7a'Access,
       To_Unbounded_String ("echec de la propriete 7a Ensemble")),
      (test_Ensemble_P7b'Access,
       To_Unbounded_String ("echec de la propriete 7b Ensemble")),
      (test_Ensemble_P8'Access,
       To_Unbounded_String ("echec de la propriete 8 Ensemble")),
      (test_Ensemble_Exception1'Access,
       To_Unbounded_String ("echec de la l'exception 1 Ensemble")),
      (test_Ensemble_Exception2'Access,
       To_Unbounded_String ("echec de la l'exception 2 Ensemble")));

   resultats : array (les_Tests'Range) of Boolean;

end tests_TAD_Ensemble;
