with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Coord;

package Claim is

   package UStr renames Ada.Strings.Unbounded;

   type ClaimRecord is
   record
     num : Integer;
     cstart : Coord.Coordinate;
     cend : Coord.Coordinate;
   end record;

   package ClaimVector is new Ada.Containers.Vectors
      (Element_Type => Claim.ClaimRecord,
      Index_Type => Natural);

   function ClaimsOverlap (c1 : in ClaimRecord; c2 : in ClaimRecord) return Boolean;
   function FromString (s : in UStr.Unbounded_String) return ClaimRecord;
   function Translate (c : in ClaimRecord; x : in Integer; y : in Integer) return ClaimRecord;

   procedure Print (c : in ClaimRecord);

end Claim;

