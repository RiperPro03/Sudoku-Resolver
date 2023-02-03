with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
with affichage;           use affichage;
with resolutions;         use resolutions;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with remplirGrille;       use remplirGrille;

procedure affichages_tests is
   g      : Type_Grille;
   l      : Type_Ensemble;
   c      : Type_Coordonnee;
   trouve : Boolean;
   nbChiffresDepart :Integer;

begin

   --------------------------------------
   -- Tests affichage de la grille
   --------------------------------------
   g := construireGrille;
   afficherGrille (g);

   --------------------------------------
   -- test affichage d'un ensemble
   --------------------------------------

   g := construireGrille;
   for i in 1 .. 9 loop
      c := construireCoordonnees (1, i);
      fixerChiffre (g, c, i);
   end loop;
   l := obtenirChiffresDUneLigne (g, 1);
   afficherEnsemble (l);
   New_Line;

   --------------------------------------
   -- Affichage de toutes les grilles
   --------------------------------------

   Put_Line ("********* Grille 1");
   g := grille1TresTresFacileDuNouvelAn2018;
   afficherGrille (g);

   Put_Line ("********* Grille 2");
   g := grille2TresTresFacile;
   afficherGrille (g);

   Put_Line ("********* Grille 3");
   g := grille3TresFacile;
   afficherGrille (g);

   Put_Line ("********* Grille 5");
   g := grille5Facile;
   afficherGrille (g);

   Put_Line ("********* Grille 4");
   g := grille4Facile;
   afficherGrille (g);

   Put_Line ("********* Grille 6");
   g := grille6Moyen;
   afficherGrille (g);

   Put_Line ("********* Grille 7");
   g := grille7Difficile;
   afficherGrille (g);

   Put_Line ("********* Grille 8");
   g := grille8Difficile;
   afficherGrille (g);

   Put_Line ("********* Grille 9");
   g := grille9TresDifficile;
   afficherGrille (g);

   -------------------------------
   -- tests resolution grille 1 --
   -------------------------------
   Put_Line
     ("********* Sudoku très très facile : grille1TresTresFacileDuNouvelAn2018");
   g := grille1TresTresFacileDuNouvelAn2018;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

   -------------------------------
   -- tests resolution grille 2 --
   -------------------------------
   Put_Line ("********* Sudoku très très facile : grille2TresTresFacile");
   g := grille2TresTresFacile;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

   -------------------------------
   -- tests resolution grille 3 --
   -------------------------------
   Put_Line ("********* Sudoku très facile : grille3TresFacile");
   g := grille3TresFacile;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

   -------------------------------
   -- tests resolution grille 4 --
   -------------------------------
   Put_Line ("********* Sudoku facile : grille4Facile");
   g := grille4Facile;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

   -------------------------------
   -- tests resolution grille 5 --
   -------------------------------
   Put_Line ("********* Sudoku facile : grille4Facile");
   g := grille5Facile;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

   -------------------------------
   -- tests resolution grille 6 --
   -------------------------------
   Put_Line ("********* Sudoku moyen : grille6Moyen");
   g := grille6Moyen;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

   -------------------------------
   -- tests resolution grille 7 --
   -------------------------------
   Put_Line ("********* Sudoku difficile : grille7Difficile");
   g := grille7Difficile;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

   -------------------------------
   -- tests resolution grille 8 --
   -------------------------------
   Put_Line ("********* Sudoku difficile : grille8Difficile");
   g := grille8Difficile;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

   -------------------------------
   -- tests resolution grille 9 --
   -------------------------------
   Put_Line ("********* Sudoku très difficile : grille9TresDifficile");
   g := grille9TresDifficile;
   afficherGrille (g);
   nbChiffresDepart := nombreChiffres (g);
   resoudreSudoku  (g, trouve);
   afficherResultat (g, trouve, nbChiffresDepart);

end affichages_tests;
