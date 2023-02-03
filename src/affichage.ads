with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;

package affichage is

   NB_POSITIONS : constant Integer := 5;
   NUL          : constant Integer := 0;

   -- affiche la valeur de la case v sur NB_POSITIONS
   procedure afficherValeur (v : in Integer);

   -- affiche la valeur de la case c de la grille g
   procedure afficherCase (g : in Type_Grille; c : in Type_Coordonnee);

   -- affiche toutes les cases de l'ensemble e
   procedure afficherEnsemble (e : in Type_Ensemble);

   -- affiche toutes les cases de la grille g
   procedure afficherGrille (g : in Type_Grille);

   -- affiche le résultat d'une tentative de résolution de la grille g
   procedure afficherResultat
     (g                : in Type_Grille;
      trouve           : in Boolean;
      nbChiffresDepart : in Integer);

end affichage;
