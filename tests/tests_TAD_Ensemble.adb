-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with TAD_ensemble; use TAD_ensemble;
with affichage;    use affichage;
-- Résolutions de sudoku
with affichage;     use affichage;
with resolutions;   use resolutions;
with remplirGrille; use remplirGrille;

package body tests_TAD_Ensemble is

   --------------------
   -- Tests Ensemble __
   --------------------

   -- test ensemble vide
   function test_Ensemble_P1 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      return ensembleVide (e);
   exception
      when others =>
         return False;
   end test_Ensemble_P1;

   -- test aucun element n'appartient a l'ensemble
   function test_Ensemble_P2 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      return ensembleVide (e);
   exception
      when others =>
         return False;
   end test_Ensemble_P2;

   -- test aucun element n'appartient a l'ensemble
   function test_Ensemble_P3 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      return nombreChiffres (e) = 0;
   exception
      when others =>
         return False;
   end test_Ensemble_P3;

   -- test ensemble avec un element non vide
   function test_Ensemble_P4 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      return not ensembleVide (e);
   exception
      when others =>
         return False;
   end test_Ensemble_P4;

   -- test appartenance element a un ensemble non vide
   -- cas n°1 : element existant
   function test_Ensemble_P5a return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      return appartientChiffre (e, 9);
   exception
      when others =>
         return False;
   end test_Ensemble_P5a;

   -- test appartenance element a un ensemble non vide
   -- cas n°2 : element non existant
   function test_Ensemble_P5b return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      return not appartientChiffre (e, 8);
   exception
      when others =>
         return False;
   end test_Ensemble_P5b;

   -- test cardinal de l'ensemble s'accroit
   function test_Ensemble_P6 return Boolean is
      e             : Type_Ensemble;
      cardinalAvant : Integer;
      i             : Integer;
   begin
      e             := construireEnsemble;
      cardinalAvant := nombreChiffres (e);
      i             := 1;
      while i < 10 loop
         ajouterChiffre (e, i);
         i := i + 1;
      end loop;
      return cardinalAvant = nombreChiffres (e) - i + 1;
   exception
      when others =>
         return False;
   end test_Ensemble_P6;

   -- test retirerChiffre sur ensemble vide
   -- cas N°1 : un seul element dans l'ensemble
   function test_Ensemble_P7a return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      retirerChiffre (e, 9);
      return ensembleVide (e);
   exception
      when others =>
         return False;
   end test_Ensemble_P7a;

   -- test retirerChiffre sur ensemble vide
   -- cas n°2 : plusieurs elements dans l'ensemble
   function test_Ensemble_P7b return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      for i in 1 .. 9 loop
         ajouterChiffre (e, i);
      end loop;
      retirerChiffre (e, 9);
      return not ensembleVide (e);
   exception
      when others =>
         return False;
   end test_Ensemble_P7b;

   -- test cardinal de l'ensemble diminiue
   function test_Ensemble_P8 return Boolean is
      e             : Type_Ensemble;
      cardinalAvant : Integer;
   begin
      e := construireEnsemble;
      for i in 1 .. 9 loop
         ajouterChiffre (e, i);
      end loop;
      cardinalAvant := nombreChiffres (e);
      retirerChiffre (e, 9);
      return cardinalAvant = nombreChiffres (e) + 1;
   exception
      when others =>
         return False;
   end test_Ensemble_P8;

   -- test de l'exception 1
   -- impossible d'ajouter un element deja existant dans un ensemble
   function test_Ensemble_Exception1 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      ajouterChiffre (e, 9);
      return appartientChiffre (e, 9);
   exception
      when APPARTIENT_ENSEMBLE =>
         return True;
      when others =>
         return False;
   end test_Ensemble_Exception1;

   -- test de l'exception 2
   -- impossible de retirer un element non existant dans un ensemble
   function test_Ensemble_Exception2 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      retirerChiffre (e, 9);
      return not appartientChiffre (e, 9);
   exception
      when NON_APPARTIENT_ENSEMBLE =>
         return True;
      when others =>
         return False;
   end test_Ensemble_Exception2;

end tests_TAD_Ensemble;
