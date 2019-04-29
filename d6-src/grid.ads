with Ada.Containers;
with Ada.Containers.Ordered_Maps;

with utils;
with Coord;

package Grid is

   type GridSquare is
   record
      coord_letter : Character;
      distance : Integer;
   end record;

   type GridArea is
   record
      coord_letter : Character;
      area : Integer;
   end record;

   package NearestSquareToCountMap is new Ada.Containers.Ordered_Maps (
      Key_Type => Character,
      Element_Type => Integer
   );

   type GridType is array (Integer range <>, Integer range <>) of GridSquare;

   function get_grid_from_bounds (bounds : Coord.Box) return GridType;
   function get_parsed_grid (bounds : Coord.Box; coords : in Coord.CoordVector.Vector) return GridType;
   function parse_coords (coords : in Coord.CoordVector.Vector) return GridType;

   procedure print (to_print : GridType);
   procedure print_square (to_print : GridSquare);
   function find_largest_area_by_closest_distance (to_search : GridType) return GridArea;
   function find_border_chars (to_search : GridType) return utils.CharacterVector.Vector;

end Grid;