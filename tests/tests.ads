with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package tests is

   type Pt_Fonction is access function return Boolean;

   type Test_Unitaire is limited record
      function_Of_Test : Pt_Fonction;
      error_Test       : Unbounded_String;
   end record;

end tests;
