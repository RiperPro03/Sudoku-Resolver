pragma Ada_2012;
package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable
     (g : in Type_Grille; v : in Integer; c : in Type_Coordonnee) return Boolean
   is
   begin
      if not caseVide(g,c) then
         raise CASE_NON_VIDE;
      else
         if appartientChiffre(obtenirChiffresDUneColonne(g,obtenirColonne(c)),v) or appartientChiffre(obtenirChiffresDUneLigne(g,obtenirLigne(c)),v) or appartientChiffre(obtenirChiffresDUnCarre(g,obtenirCarre(c)),v) then
           return false;
         else
           return true;
         end if;
      end if;
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
      e: Type_Ensemble;
   begin
      e:=construireEnsemble;
      if not caseVide(g,c) then
         raise CASE_NON_VIDE;
      end if;
      for i in 1 .. 9 loop
         if estChiffreValable(g,i,c) then
            ajouterChiffre(e,i);
         end if;
      end loop;
      return e;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
   begin
       if nombreChiffres(resultats) > 1 then
         raise PLUS_DE_UN_CHIFFRE;
      elsif nombreChiffres(resultats) = 0 then
         raise ENSEMBLE_VIDE;
      else
         for i in 1..9 loop
            if appartientChiffre(resultats,i) then
               return i;
            end if;
         end loop;
      end if;
      return 0;
   end rechercherSolutionUniqueDansEnsemble;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean) is
      b : boolean;
      -- copy : Type_Grille;
   begin
      simpleResolution(g,b);
      if b then
         trouve:= True;
      else
         trouve:= False;
      --    backResolution(g);
      end if;

   end resoudreSudoku;

   ----------------------
   -- simpleResolution --
   ----------------------

   procedure simpleResolution (g : in out Type_Grille; trouve : out Boolean) is

      possible : Type_ensemble;
      c : Type_Coordonnee;
      b : Boolean := False;
   begin
      trouve:= false;
      while not estRemplie(g) and not b loop
         b := True;
         for y in 1..9 loop
            for x in 1..9 loop
               c := construireCoordonnees(y,x);
               if Casevide (g,c) then
                  possible := obtenirSolutionsPossibles(g,c);
                  if nombreChiffres(possible) = 1 then
                     fixerChiffre (g,c,rechercherSolutionUniqueDansEnsemble(possible));
                     b := false;
                  end if;
               end if;
            end loop;
         end loop;
         if b then
            trouve := false;
         else
            trouve := True;
         end if;
      end loop;
   end simpleResolution;

   ----------------------
   -- backResolution --
   ----------------------

   procedure backResolution (g : in out Type_Grille) is
      c : Type_Coordonnee;
      possible : Type_ensemble;
      copy : Type_Grille;
   begin
      copy:= g;
      for y in 1..9 loop
         for x in 1..9 loop
            c := construireCoordonnees(y,x);
            if Casevide (copy,c) then
               possible := obtenirSolutionsPossibles(copy,c);

               for i in 1 .. nombreChiffres(possible) loop
                  fixerChiffre (copy,c,ieme_e(possible,i));
                  backResolution(copy);
                  viderCase(copy,c);
               end loop;
               
            end if;
         end loop;
      end loop;
      g:= copy;
   end backResolution;


end resolutions;
