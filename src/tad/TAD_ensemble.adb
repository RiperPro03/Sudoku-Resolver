pragma Ada_2012;
package body TAD_ensemble is

   ------------------------
   -- construireEnsemble --
   ------------------------

   function construireEnsemble return Type_Ensemble is
    e : Type_Ensemble;
   begin
      e.nbElements:= 0;
      return e;
   end construireEnsemble;

   ------------------
   -- ensembleVide --
   ------------------

   function ensembleVide (e : in Type_Ensemble) return Boolean is
   begin
      return e.nbElements = 0;
   end ensembleVide;

   -----------------------
   -- appartientChiffre --
   -----------------------

   function appartientChiffre
     (e : in Type_Ensemble; v : in Integer) return Boolean
   is
      i : integer:= 1;
   begin
      while i <= e.nbElements and e.Elements(i) /= v loop
            i := i + 1;
      end loop;
      if i <= e.nbElements then
         return True;
      else
         return False;
      end if;
   end appartientChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (e : in Type_Ensemble) return Integer is
   begin
      return e.nbElements;
   end nombreChiffres;

   --------------------
   -- ajouterChiffre --
   --------------------

   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if appartientChiffre(e,v) then
         raise APPARTIENT_ENSEMBLE;
      end if;
      if e.nbElements = TAILLE_MAX then
         raise DEBORDEMENT;
      end if;
      e.nbElements:= e.nbElements + 1;
      e.Elements(e.nbElements):= v;
      
   end ajouterChiffre;

   --------------------
   -- retirerChiffre --
   --------------------

   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
      i : integer:= 1;
      rang : Integer;
   begin
      if not appartientChiffre(e,v) then
         raise NON_APPARTIENT_ENSEMBLE;
      end if;
      rang:= 0;
      while i <= e.nbElements and e.Elements(i) /= v loop
         i := i + 1;
      end loop;
      rang:= i;
      if i = TAILLE_MAX then
         e.Elements(rang):= 0;
         e.nbElements:= e.nbElements - 1;
      else
         for j in rang .. e.nbElements loop
            e.Elements(j):= e.Elements( j + 1);
         end loop;
         e.nbElements:= e.nbElements - 1;
      end if;

   end retirerChiffre;

   ----------
   -- ieme --
   ----------

   function ieme_e (e : in Type_Ensemble; v : in Integer) return Integer is
   begin
      return e.Elements(v);
   end ieme_e;

end TAD_ensemble;
