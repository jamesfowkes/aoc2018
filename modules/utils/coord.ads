with Ada.Strings.Unbounded;
with Ada.Containers;

package Coord is

   package UStr renames Ada.Strings.Unbounded;

   type Coordinate is
   record
       x: Integer;
       y: Integer;
   end record;

   function To_String(c: in Coordinate) return UStr.Unbounded_String;
   function Hash (c: in Coordinate) return Ada.Containers.Hash_Type;
   function "=" (c1: in Coordinate; c2: in Coordinate) return Boolean;
end Coord;
