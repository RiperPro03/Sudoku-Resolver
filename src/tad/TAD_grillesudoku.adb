pragma Ada_2012;
package body TAD_grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
      grille : Type_Grille;
   begin
      for i in 1..9 loop
         for j in 1 ..9 loop
            grille(i,j):= 0;
         end loop;
      end loop;
      return grille;
   end construireGrille;

   --------------
   -- caseVide --
   --------------

   function caseVide
     (g : in Type_Grille; c : in Type_Coordonnee) return Boolean
   is
   begin
      return g(obtenirLigne(c), obtenirColonne(c)) = 0;
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
      v: Integer;
   begin
      v:=g(obtenirLigne(c), obtenirColonne(c));
      if v < 1 then
         raise OBTENIR_CHIFFRE_NUL;
      end if;
      return v;
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      v: Integer;
      c: Type_Coordonnee;
   begin
      v:=0;
      for i in 1..9 loop
         for j in 1 ..9 loop
            c:=construireCoordonnees(i,j);
            if g(obtenirLigne(c), obtenirColonne(c)) > 0 and g(obtenirLigne(c), obtenirColonne(c)) < 10 then
               v:= v + 1;
            end if;
         end loop;
      end loop;
      return v;
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre
     (g : in out Type_Grille; c : in Type_Coordonnee; v : in Integer)
   is
   begin
      if g(obtenirLigne(c), obtenirColonne(c)) /= 0 then
         raise FIXER_CHIFFRE_NON_NUL;
      end if;
      g(obtenirLigne(c), obtenirColonne(c)):= v;
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------

   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      if g(obtenirLigne(c), obtenirColonne(c)) = 0 then
         raise VIDER_CASE_VIDE;
      else
         g(obtenirLigne(c), obtenirColonne(c)):= 0;
      end if;
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
   begin
      return nombreChiffres(g) = 81;
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

  function obtenirChiffresDUneLigne
     (g : in Type_Grille; numLigne : in Integer) return Type_Ensemble
   is
   e: Type_Ensemble;
   begin
      e:= construireEnsemble;
      for i in 1..9 loop
         if not caseVide(g, construireCoordonnees(numLigne, i)) then
            ajouterChiffre(e, (g(numLigne, i)));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne
     (g : in Type_Grille; numColonne : in Integer) return Type_Ensemble
   is
   e: Type_Ensemble;
   begin
      e:= construireEnsemble;
      for i in 1..9 loop
         if not caseVide(g, construireCoordonnees(i, numColonne)) then
            ajouterChiffre(e, (g(i, numColonne)));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre
     (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble
   is
      result: Type_Ensemble;
      trouver: Integer;
      crd:Type_Coordonnee;
   begin
      result:= construireEnsemble;
      crd:= obtenirCoordonneeCarre(numCarre);
      for i in 0..2 loop
         for j in 0..2 loop
            trouver:= g(obtenirLigne(crd ) + i,obtenirColonne(crd) + j);
            if trouver /= 0 then
               ajouterChiffre(result, trouver);
            end if;
         end loop;
      end loop;
      return result;
   end obtenirChiffresDUnCarre;
   end TAD_grilleSudoku;


