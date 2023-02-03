pragma Ada_2012;
package body TAD_Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees
     (ligne : in Integer; colonne : in Integer) return Type_Coordonnee
   is
      c : Type_Coordonnee;
   begin
      c.ligne:= ligne;
      c.colonne:= colonne;
      return c;
   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------

   function obtenirLigne (c : in Type_Coordonnee) return Integer is
   begin
      return c.ligne;
   end obtenirLigne;

   --------------------
   -- obtenirColonne --
   --------------------

   function obtenirColonne (c : in Type_Coordonnee) return Integer is
   begin
      return c.colonne;
   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------

   function obtenirCarre (c : in Type_Coordonnee) return Integer is
      nbCarre : Integer;
   begin
      if c.ligne <= 3 then    -- 3
         if c.colonne <= 3 then
            nbCarre:= 1;
         elsif c.colonne <= 6 then
            nbCarre:= 2;
         elsif c.colonne <= 9 then
            nbCarre:= 3;
         end if;
      elsif c.ligne <= 6 then -- 6
         if c.colonne <= 3 then
            nbCarre:= 4;
         elsif c.colonne <= 6 then
            nbCarre:= 5;
         elsif c.colonne <= 9 then
            nbCarre:= 6;
         end if;
      elsif c.ligne <= 9 then -- 9
         if c.colonne <= 3 then
            nbCarre:= 7;
         elsif c.colonne <= 6 then
            nbCarre:= 8;
         elsif c.colonne <= 9 then
            nbCarre:= 9;
         end if;
      end if;
      return nbCarre;
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre (numCarre : in Integer) return Type_Coordonnee
   is
    c : Type_Coordonnee;
   begin
      case numCarre is
         when 1 =>   c.ligne:= 1;
                     c.colonne:= 1;
         when 2 =>   c.ligne:= 1;
                     c.colonne:= 4;
         when 3 =>   c.ligne:= 1;
                     c.colonne:= 7;
         when 4 =>   c.ligne:= 4;
                     c.colonne:= 1;
         when 5 =>   c.ligne:= 4;
                     c.colonne:= 4;
         when 6 =>   c.ligne:= 4;
                     c.colonne:= 7;
         when 7 =>   c.ligne:= 7;
                     c.colonne:= 1;
         when 8 =>   c.ligne:= 7;
                     c.colonne:= 4;
         when 9 =>   c.ligne:= 7;
                     c.colonne:= 7;
         when others => raise NUMCARRE_INCONNU;
      end case;
      return c;
   end obtenirCoordonneeCarre;

end TAD_Coordonnee;
