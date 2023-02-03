-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
-- Résolutions de sudoku
with affichage;     use affichage;
with resolutions;   use resolutions;
with remplirGrille; use remplirGrille;

-------------------------------
-- tests resolution grille 4 --
-------------------------------

procedure test_Resolution_Grille_4 is
   g      : Type_Grille;
   trouve : Boolean;
begin
   Put_Line ("********* Sudoku facile : grille4Facile");
   g := grille4Facile;
   afficherGrille (g);
   resoudreSudoku (g, trouve);
   if trouve then
      Put_Line ("Grille 4 reussie");
   else
      Put_Line ("grille 4 ratee");
   end if;
   afficherGrille(g);

end test_Resolution_Grille_4;
