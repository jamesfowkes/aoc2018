with Ada.Containers;

package Coord is

   type Coordinate is
   record
      x : Integer;
      y : Integer;
   end record;

   function To_String (c : in Coordinate) return String;
   function Hash  (c : in Coordinate) return Ada.Containers.Hash_Type;
   function "=" (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function From_String (s : in String) return Coordinate;
   function Manhattan (c1 : in Coordinate; c2 : in Coordinate) return Integer;

end Coord;
