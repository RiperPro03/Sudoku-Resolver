with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body affichage is

   --------------------
   -- afficherValeur --
   --------------------

   -- affiche la valeur de la case v sur NB_POSITIONS
   procedure afficherValeur (v : in Integer) is
   begin
      Put (v, NB_POSITIONS);
   end afficherValeur;

   ------------------
   -- afficherCase --
   ------------------

   procedure afficherCase (g : in Type_Grille; c : in Type_Coordonnee) is
      valeur : Integer;
   begin
      if caseVide (g, c) then
	 valeur := 0;
      else
	 valeur := obtenirChiffre (g, c);
      end if;
      afficherValeur (valeur);
   end afficherCase;

   ----------------------
   -- afficherEnsemble --
   ----------------------

   procedure afficherEnsemble (e : in Type_Ensemble) is
   begin
      for i in 1 .. 9 loop
	 if appartientChiffre (e, i) then
	    afficherValeur (i);
	 else
	    afficherValeur (NUL);
	 end if;
      end loop;
      New_Line;
   end afficherEnsemble;

   --------------------
   -- afficherGrille --
   --------------------

   procedure afficherLigne is
   begin
      Put ("      ");
      for k in 1 .. NB_POSITIONS loop
	 for l in 1 .. 9 loop
	    Put ("-");
	 end loop;
      end loop;
      New_Line;
   end afficherLigne;

   procedure afficherGrille (g : in Type_Grille) is
      c : Type_Coordonnee;
   begin
      New_Line;
      afficherLigne;
      for i in 1 .. 9 loop
	 Put (" |");
	 for j in 1 .. 9 loop
	    c := construireCoordonnees (i, j);
	    afficherCase (g, c);
	    if j mod 3 = 0 then
	       Put (" |");
	    end if;
	 end loop;
	 New_Line;
	 if i mod 3 = 0 then
	    afficherLigne;
	 end if;
      end loop;
      New_Line;
   end afficherGrille;

   ----------------------
   -- afficherResultat --
   ----------------------

   procedure afficherResultat
     (g                : in Type_Grille;
      trouve           : in Boolean;
      nbChiffresDepart : in Integer)
   is
   begin
      if trouve then
	 Put_Line ("Sudoku résolu");
      else
	 Put_Line ("Resultat non trouve");
	 Put ("Nombre de chiffres trouves : ");
	 Put (nombreChiffres (g) - nbChiffresDepart, 0);
	 Put_Line (" sur 81");
      end if;
      afficherGrille (g);
   end afficherResultat;

end affichage;
