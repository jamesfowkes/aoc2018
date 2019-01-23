with Ada.Strings.Unbounded;
with Ada.Containers;
with Ada.Strings.Hash;

package body Coord is

   function To_String(c: in Coordinate) return UStr.Unbounded_String is
   begin
      return UStr.To_Unbounded_String(Integer'Image(c.x) & "," & Integer'Image(c.y));
   end To_String;

   function Hash (c: in Coordinate) return Ada.Containers.Hash_Type is
   begin
      return Ada.Strings.Hash(UStr.To_String(To_String(c)));
   end Hash;

   function "=" (c1: in Coordinate; c2: in Coordinate) return Boolean is
   begin
      return (c1.x = c2.x) and (c1.y = c2.y);
   end "=";

end Coord;
