with Coord;

package Grid is

   type GridSquare is
   record
      coord_index : Integer;
      distance : Integer;
   end record;

   type GridType is array (Integer range <>, Integer range <>) of GridSquare;

   function get_grid_from_bounds (bounds : Coord.Box) return GridType;
   function get_parsed_grid (bounds : Coord.Box; coords : in Coord.CoordVector.Vector) return GridType;
   function parse_coords (coords : in Coord.CoordVector.Vector) return GridType;

   procedure print (to_print : GridType);

end Grid;