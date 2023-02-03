with tests_TAD_Coordonnee; use tests_TAD_Coordonnee;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure run_Tests_TAD_Coordonnee is
begin
   -- execution automatique des tests pour le TAD Coordonnee
   Put_Line("***** Tests TAD Coordonnées");
   for i in tests_TAD_Coordonnee.les_Tests'Range loop
      put("test ");
      put(i,0);
      tests_TAD_Coordonnee.resultats(i) := tests_TAD_Coordonnee.les_Tests(i).function_Of_Test.all;
      Put_Line (" passé");
   end loop;
   -- affichage des resultats
   if (for all i in tests_TAD_Coordonnee.resultats'Range => tests_TAD_Coordonnee.resultats(i)) then
      put_line ("Tous les tests OK");
   else
      put_line ("***** ATTENTION *****");
      for i in tests_TAD_Coordonnee.resultats'Range loop
         if not tests_TAD_Coordonnee.resultats(i) then
            put_line (to_String(tests_TAD_Coordonnee.les_Tests(i).error_Test));
         end if;
      end loop;
   end if;

end run_Tests_TAD_Coordonnee;
