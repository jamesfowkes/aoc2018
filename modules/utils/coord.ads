with Ada.Containers;
with Ada.Containers.Vectors;

package Coord is

   type Coordinate is
   record
      x : Integer;
      y : Integer;
   end record;

   type Box is
   record
      min : Coordinate;
      max : Coordinate;
   end record;

   function To_String (c : in Coordinate) return String;
   function Hash  (c : in Coordinate) return Ada.Containers.Hash_Type;
   function From_String (s : in String) return Coordinate;
   function Manhattan (c1 : in Coordinate; c2 : in Coordinate) return Integer;
   function Manhattan (c1 : in Coordinate; x : Integer; y : Integer) return Integer;

   function "=" (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function Under (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function Over (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function LeftOf (c1 : in Coordinate; c2 : in Coordinate) return Boolean;
   function RightOf (c1 : in Coordinate; c2 : in Coordinate) return Boolean;

   package CoordVector is new Ada.Containers.Vectors
      (Element_Type => Coordinate,
      Index_Type => Natural);

   function GetBounds (coords : CoordVector.Vector; add_border : Integer := 0) return Box;

end Coord;
