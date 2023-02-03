-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
with affichage;        use affichage;

package body tests_TAD_Grille is

   ------------------
   -- Tests Grille --
   ------------------

   -- creation grille
   -- verification cases vides
   function test_Grille_P1 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      for i in 1 .. 9 loop
         for j in 1 .. 9 loop
            c := construireCoordonnees (i, j);
            if (not caseVide (g, c)) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   exception
      when others =>
         return False;
   end test_Grille_P1;

   -- creation grille
   -- verification  nombre de chiffres = 0
   function test_Grille_P2 return Boolean is
      g : Type_Grille;
   begin
      g := construireGrille;
      return nombreChiffres (g) = 0;
   exception
      when others =>
         return False;
   end test_Grille_P2;

   -- creation grille
   -- verification  estRempli est FAUX
   function test_Grille_P3 return Boolean is
      g : Type_Grille;
   begin
      g := construireGrille;
      return estRemplie (g) = False;
   exception
      when others =>
         return False;
   end test_Grille_P3;

   -- creation grille
   -- verification lignes vides
   function test_Grille_P4 return Boolean is
      g     : Type_Grille;
      ligne : Type_Ensemble;
   begin
      g := construireGrille;
      for i in 1 .. 9 loop
         ligne := obtenirChiffresDUneLigne (g, i);
         -- afficherEnsemble(ligne);
         if not ensembleVide (ligne) then
            return False;
         end if;
      end loop;
      return True;
   exception
      when others =>
         return False;
   end test_Grille_P4;

   -- creation grille
   -- verification colonnes vides
   function test_Grille_P5 return Boolean is
      g       : Type_Grille;
      colonne : Type_Ensemble;
   begin
      g := construireGrille;
      for j in 1 .. 9 loop
         colonne := obtenirChiffresDUneColonne (g, j);
         if not ensembleVide (colonne) then
            return False;
         end if;
      end loop;
      return True;
   exception
      when others =>
         return False;
   end test_Grille_P5;

   -- creation grille
   -- verification colonnes vides
   function test_Grille_P6 return Boolean is
      g     : Type_Grille;
      carre : Type_Ensemble;
   begin
      g := construireGrille;
      for i in 1 .. 9 loop
         carre := obtenirChiffresDUnCarre (g, i);
         if not ensembleVide (carre) then
            return False;
         end if;
      end loop;
      return True;
   exception
      when others =>
         return False;
   end test_Grille_P6;

   -- FixerChiffre
   -- case remplie devient non vide
   function test_Grille_P7a return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      return not caseVide (g, c);
   exception
      when others =>
         return False;
   end test_Grille_P7a;

   -- FixerChiffre
   -- autres cases non remplies restent vide
   function test_Grille_P7b return Boolean is
      g  : Type_Grille;
      c1 : Type_Coordonnee;
      c2 : Type_Coordonnee;
   begin
      g  := construireGrille;
      c1 := construireCoordonnees (9, 9);
      fixerChiffre (g, c1, 8);
      for i in 1 .. 9 loop
         for j in 1 .. 9 loop
            c2 := construireCoordonnees (i, j);
            if c2 /= c1 and not caseVide (g, c2) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   exception
      when others =>
         return False;
   end test_Grille_P7b;

   -- FixerChiffre
   -- case remplie retourne la valeur entree
   function test_Grille_P8 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      return obtenirChiffre (g, c) = 8;
   exception
      when others =>
         return False;
   end test_Grille_P8;

   -- FixerChiffre
   -- nombre de valeurs entree s'incremente de 1
   function test_Grille_P9 return Boolean is
      g             : Type_Grille;
      c             : Type_Coordonnee;
      cardinalAvant : Integer;
   begin
      g             := construireGrille;
      cardinalAvant := nombreChiffres (g);
      c             := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      return cardinalAvant = nombreChiffres (g) - 1;
   exception
      when others =>
         return False;
   end test_Grille_P9;

   -- FixerChiffre
   -- ne modifie pas est remplie
   function test_Grille_P10a return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      return not estRemplie (g);
   exception
      when others =>
         return False;
   end test_Grille_P10a;

   -- FixerChiffre
   -- modifie est remplie
   function test_Grille_P10b return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      for i in 1 .. 9 loop
         for j in 1 .. 9 loop
            c := construireCoordonnees (i, j);
            fixerChiffre (g, c, i);
         end loop;
      end loop;
      return estRemplie (g);
   exception
      when others =>
         return False;
   end test_Grille_P10b;

   -- FixerChifre
   -- modifie la ligne correspondante
   function test_Grille_P11 return Boolean is
      g     : Type_Grille;
      c     : Type_Coordonnee;
      ligne : Type_Ensemble;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      ligne := obtenirChiffresDUneLigne (g, obtenirLigne (c));
      return appartientChiffre (ligne, 8);
   exception
      when others =>
         return False;
   end test_Grille_P11;

   -- FixerChifre
   -- modifie la colonne correspondante
   function test_Grille_P12 return Boolean is
      g       : Type_Grille;
      c       : Type_Coordonnee;
      colonne : Type_Ensemble;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      colonne := obtenirChiffresDUneColonne (g, obtenirColonne (c));
      return appartientChiffre (colonne, 8);
   exception
      when others =>
         return False;
   end test_Grille_P12;

   -- FixerChifre
   -- modifie la carre correspondante
   function test_Grille_P13 return Boolean is
      g     : Type_Grille;
      c     : Type_Coordonnee;
      carre : Type_Ensemble;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      carre := obtenirChiffresDUnCarre (g, obtenirCarre (c));
      return appartientChiffre (carre, 8);
   exception
      when others =>
         return False;
   end test_Grille_P13;

   -- ViderChiffre
   -- case remplie devient  vide
   function test_Grille_P14a return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      viderCase (g, c);
      return caseVide (g, c);
   exception
      when others =>
         return False;
   end test_Grille_P14a;

   -- ViderChiffre
   -- autres cases non remplies restent vide
   function test_Grille_P14b return Boolean is
      g  : Type_Grille;
      c1 : Type_Coordonnee;
      c2 : Type_Coordonnee;
   begin
      g  := construireGrille;
      c1 := construireCoordonnees (9, 9);
      fixerChiffre (g, c1, 8);
      viderCase (g, c1);
      for i in 1 .. 9 loop
         for j in 1 .. 9 loop
            c2 := construireCoordonnees (i, j);
            if not caseVide (g, c2) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   exception
      when others =>
         return False;
   end test_Grille_P14b;

   -- ViderChiffre
   -- est remplie retourne FAUX
   function test_Grille_P15 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      -- construction de la grille
      g := construireGrille;
      -- remplissage bidon de la grille
      for i in 1 .. 9 loop
         for j in 1 .. 9 loop
            c := construireCoordonnees (i, j);
            fixerChiffre (g, c, 8);
         end loop;
      end loop;
      -- vidage d'une valeur de la grille
      c := construireCoordonnees (9, 9);
      viderCase (g, c);
      return not estRemplie (g);
   exception
      when others =>
         return False;
   end test_Grille_P15;

   -- VideChiffre
   -- nombre de valeurs entree ne se modifie pas
   function test_Grille_P16 return Boolean is
      g             : Type_Grille;
      c             : Type_Coordonnee;
      cardinalAvant : Integer;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      cardinalAvant := nombreChiffres (g);
      viderCase (g, c);
      return cardinalAvant = nombreChiffres (g) + 1;
   exception
      when others =>
         return False;
   end test_Grille_P16;

   -- ViderChifre
   -- modifie la ligne correspondante
   function test_Grille_P17 return Boolean is
      g     : Type_Grille;
      c     : Type_Coordonnee;
      ligne : Type_Ensemble;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      viderCase (g, c);
      ligne := obtenirChiffresDUneLigne (g, obtenirLigne (c));
      return not appartientChiffre (ligne, 8);
   exception
      when others =>
         return False;
   end test_Grille_P17;

   -- ViderChifre
   -- modifie la colonne correspondante
   function test_Grille_P18 return Boolean is
      g       : Type_Grille;
      c       : Type_Coordonnee;
      colonne : Type_Ensemble;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      viderCase (g, c);
      colonne := obtenirChiffresDUneColonne (g, obtenirColonne (c));
      return not appartientChiffre (colonne, 8);
   exception
      when others =>
         return False;
   end test_Grille_P18;

   -- ViderChifre
   -- modifie la carre correspondante
   function test_Grille_P19 return Boolean is
      g     : Type_Grille;
      c     : Type_Coordonnee;
      carre : Type_Ensemble;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      viderCase (g, c);
      carre := obtenirChiffresDUnCarre (g, obtenirCarre (c));
      return not appartientChiffre (carre, 8);
   exception
      when others =>
         return False;
   end test_Grille_P19;

   -- Exception 1 : obtenirChiffre (g, c) est defini ssi non caseVide (g, c)
   function test_Grille_Exception1 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      return obtenirChiffre (g, c) = 0;
   exception
      when OBTENIR_CHIFFRE_NUL =>
         return True;
      when others =>
         return False;
   end test_Grille_Exception1;

   function test_Grille_Exception2 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre (g, c, 8);
      fixerChiffre (g, c, 1);
      return obtenirChiffre (g, c) = 1;
   exception
      when FIXER_CHIFFRE_NON_NUL =>
         return True;
      when others =>
         return False;
   end test_Grille_Exception2;

   function test_Grille_Exception3 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      viderCase (g, c);
      return caseVide (g, c);
   exception
      when VIDER_CASE_VIDE =>
         return True;
      when others =>
         return False;
   end test_Grille_Exception3;

end tests_TAD_Grille;
