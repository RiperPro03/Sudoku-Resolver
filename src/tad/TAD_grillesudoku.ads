with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;

package TAD_grilleSudoku is

   type Type_Grille is private;

   FIXER_CHIFFRE_NON_NUL : exception;
   OBTENIR_CHIFFRE_NUL : exception;
   VIDER_CASE_VIDE : exception;
   CASE_NON_VIDE : exception;

   -- cree une grille vide
   function construireGrille return Type_Grille;

   -- retourne VRAI si la case de coordonnee c de la grille g est vide
   -- et FAUX sinon
   function caseVide
     (g : in Type_Grille;
      c : in Type_Coordonnee) return Boolean;

   -- retourne la valeur de la case de coordonnee c de la grille g
   -- nécessite la case c n'est pas vide
   -- lève l'exception OBTENIR_CHIFFRE_NUL si la case c est vide
   function obtenirChiffre
     (g : in Type_Grille;
      c : in Type_Coordonnee) return Integer;

   -- retourne le nombre de chiffres places dans la grille g
   function nombreChiffres (g : in Type_Grille) return Integer;

   -- positionne la valeur v de la case de coordonnee c de la grille g
   -- nécessite que la case c soit vide
   -- lève l'exception FIXER_CHIFFRE_NON_NUL si la case est vide
   procedure fixerChiffre
     (g : in out Type_Grille;
      c : in     Type_Coordonnee;
      v : in     Integer);

   -- vide la case de coordonnee c de la grille g
   -- nécessite que la case c ne soit pas vide
   -- lève l'exception VIDER_CASE_VIDE si c est vide
   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee);

   -- retourne VRAI si la grille est totalement remplie et FAUX sinon
   function estRemplie (g : in Type_Grille) return Boolean;

   -- retourne la ligne l de la grille g
   function obtenirChiffresDUneLigne
     (g        : in Type_Grille;
      numLigne : in Integer) return Type_Ensemble;

   -- retourne la colonne c de la grille g
   function obtenirChiffresDUneColonne
     (g          : in Type_Grille;
      numColonne : in Integer) return Type_Ensemble;

   -- retourne le carre c de la grille g
   function obtenirChiffresDUnCarre
     (g        : in Type_Grille;
      numCarre : in Integer) return Type_Ensemble;

private
   type Type_Grille is array (1 .. 9, 1 .. 9) of Integer;

end TAD_grilleSudoku;
