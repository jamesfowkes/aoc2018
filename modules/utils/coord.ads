with Ada.Containers;
with Ada.Containers.Vectors;

package Coord is

   type Coordinate is
   record
      x : Integer;
      y : Integer;
   end record;

   function To_String (c : in Coordinate) return String;
   function Hash  (c : in Coordinate) return Ada.Containers.Hash_Type;
   function From_String (s : in String) return Coordinate;
   function Manhattan (c1 : in Coordinate; c2 : in Coordinate) return Integer;

   function "=" (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function Under (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function Over (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function LeftOf (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function RightOf (c1 : in Coordinate; c2 : in Coordinate) return Boolean;

   package CoordVector is new Ada.Containers.Vectors
      (Element_Type => Coordinate,
      Index_Type => Natural);

end Coord;
