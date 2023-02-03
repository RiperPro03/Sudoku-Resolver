with TAD_Coordonnee;      use TAD_Coordonnee;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body remplirGrille is

   function Remplir_Grille (Nom_Fichier : String) return Type_Grille is
      G : Type_Grille;
      C : Type_Coordonnee;
      F : File_Type;
      V : Integer range 0 .. 9;
   begin
      -- ouverture du fichier
      Open (F, In_File, "grilles/" & Nom_Fichier);
      -- remplissage grille
      G := construireGrille;
      for I in 1 .. 9 loop
         for J in 1 .. 9 loop
            Get (F, V, 1);
            C := construireCoordonnees (I, J);
            fixerChiffre (G, C, V);
         end loop;
         if not End_Of_File (F) then
            Skip_Line (F);
         end if;
      end loop;
      Close (F);
      return G;
   end Remplir_Grille;

   ------------------------------
   -- grille du nouvel an 2018 --
   ------------------------------

   function grille1TresTresFacileDuNouvelAn2018 return Type_Grille is
   begin
      return Remplir_Grille ("grille1TresTresFacileDuNouvelAn2018.txt");
   end grille1TresTresFacileDuNouvelAn2018;

   --------------------------
   -- grille2TresTresFacile --
   --------------------------

   function grille2TresTresFacile return Type_Grille is
   begin
      return Remplir_Grille ("grille2TresTresFacile.txt");
   end grille2TresTresFacile;

   -----------------------
   -- grille3TresFacile --
   -----------------------

   function grille3TresFacile return Type_Grille is
   begin
      return Remplir_Grille ("grille3TresFacile.txt");
   end grille3TresFacile;

   -------------------
   -- grille4Facile --
   -------------------

   function grille4Facile return Type_Grille is
   begin
      return Remplir_Grille ("grille4Facile.txt");
   end grille4Facile;

   -------------------
   -- grille5Facile --
   -------------------

   function grille5Facile return Type_Grille is
   begin
      return Remplir_Grille ("grille5Facile.txt");
   end grille5Facile;

   -------------------
   -- grille6Moyen --
   -------------------

   function grille6Moyen return Type_Grille is
   begin
      return Remplir_Grille ("grille6Moyen.txt");
   end grille6Moyen;

   -----------------------
   -- grille7Difficile --
   -----------------------

   function grille7Difficile return Type_Grille is
   begin
      return Remplir_Grille ("grille7Difficile.txt");
   end grille7Difficile;

   ---------------------
   -- grille8Difficile --
   ---------------------

   function grille8Difficile return Type_Grille is
   begin
      return Remplir_Grille ("grille8Difficile.txt");
   end grille8Difficile;

   -------------------------
   -- grille9TresDifficile --
   -------------------------

   function grille9TresDifficile return Type_Grille is
   begin
      return Remplir_Grille ("grille9TresDifficile.txt");
   end grille9TresDifficile;

end remplirGrille;
