with tests_Resolutions ; use tests_Resolutions;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure run_Tests_Resolutions is
begin
   -- execution automatique des tests de résolution
   Put_Line("***** Tests résolution de grilles");
   for i in tests_Resolutions.les_Tests'Range loop
      put("test ");
      put(i,0);
      tests_Resolutions.resultats(i) := tests_Resolutions.les_Tests(i).function_Of_Test.all;
      Put_Line (" passé");
   end loop;
   -- affichage des resultats
   if (for all i in tests_Resolutions.resultats'Range => tests_Resolutions.resultats(i)) then
      put_line ("Tous les tests OK");
   else
      put_line ("***** ATTENTION *****");
      for i in tests_Resolutions.resultats'Range loop
         if not tests_Resolutions.resultats(i) then
            put_line (to_String(tests_Resolutions.les_Tests(i).error_Test));
         end if;
      end loop;
   end if;

end run_Tests_Resolutions;
