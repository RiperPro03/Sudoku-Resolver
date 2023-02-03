with tests_TAD_Ensemble; use tests_TAD_Ensemble;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure run_Tests_TAD_Ensemble is
begin
   -- execution automatique des tests pour le TAD Ensemble
   Put_Line("***** Tests TAD Ensemble");
   for i in tests_TAD_Ensemble.les_Tests'Range loop
      put("test ");
      put(i,0);
      tests_TAD_Ensemble.resultats(i) := tests_TAD_Ensemble.les_Tests(i).function_Of_Test.all;
      Put_Line (" passé");
   end loop;
   -- affichage des resultats
   if (for all i in tests_TAD_Ensemble.resultats'Range => tests_TAD_Ensemble.resultats(i)) then
      put_line ("Tous les tests OK");
   else
      put_line ("***** ATTENTION *****");
      for i in tests_TAD_Ensemble.resultats'Range loop
         if not tests_TAD_Ensemble.resultats(i) then
            put_line (to_String(tests_TAD_Ensemble.les_Tests(i).error_Test));
         end if;
      end loop;
   end if;

end run_Tests_TAD_Ensemble;
