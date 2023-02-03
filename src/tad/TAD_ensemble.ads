package TAD_ensemble is

   APPARTIENT_ENSEMBLE : exception;
   NON_APPARTIENT_ENSEMBLE : exception;
   DEBORDEMENT : exception;
   
   TAILLE_MAX : constant integer := 9;
   type Type_Ensemble is private;

   -- retourne un ensemble vide
   function construireEnsemble return Type_Ensemble;

   -- retourne VRAI si l'ensemble e est vide et FAUX sinon
   function ensembleVide (e : in Type_Ensemble) return Boolean;

   -- retourne VRAI si le chiffre v est present dans l'ensemble e
   function appartientChiffre
     (e : in Type_Ensemble; v : in Integer) return Boolean;

   -- retourne le nombre d'elements de l'ensemble e
   function nombreChiffres (e : in Type_Ensemble) return Integer;

   -- ajoute le chiffre v dans l'ensemble e
   -- nécessite l'element v n'existe pas dans l'ensemble e
   -- lève l'exception APPARTIENT_ENSEMBLE si v appartient à l'ensemble
   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer);

   -- supprime le chiffre v dans l'ensemble e
   -- nécessite l'element v existe dans l'ensemble e
   -- lève l'exception NON_APPARTIENT_ENSEMBLE si v n'appartient pas à l'ensemble
   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer);

   -- retourne le ième element du Type_Ensemble e
   function ieme_e (e : in Type_Ensemble; v : in Integer) return Integer;

private
   type Tab_Integer is array (1 .. TAILLE_MAX) of Integer;

   type Type_Ensemble is record
      nbElements: integer; --nombre d'élement de la pile
      Elements: Tab_Integer; --tableau d'entier de la pile
   end record;

end TAD_ensemble ;
