with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Grid is

   function get_grid_from_bounds (bounds : Coord.Box) return GridType is
   begin
      declare
         NewGrid : constant Grid.GridType (bounds.min.x .. bounds.max.x, bounds.min.y .. bounds.max.y) :=
           (others => (others => (0, 0)));
      begin
         return NewGrid;
      end;
   end get_grid_from_bounds;

   function get_parsed_grid (bounds : Coord.Box; coords : in Coord.CoordVector.Vector) return GridType is
      grid_square : Grid.GridSquare;
      count : Integer := 0;
      distance : Integer;
      new_grid : Grid.GridType (bounds.min.x .. bounds.max.x, bounds.min.y .. bounds.max.y);
   begin
      for X in Integer range bounds.min.x .. bounds.max.x loop
         for Y in Integer range bounds.min.y .. bounds.max.y loop
            grid_square.coord_index := -1;
            grid_square.distance := Natural'Last;
            for C : Coord.Coordinate of coords loop
               distance := Coord.Manhattan (C, X, Y);
               if distance < grid_square.distance then
                  grid_square.coord_index := count;
                  grid_square.distance := distance;
               elsif distance = grid_square.distance then
                  grid_square.coord_index := -1;
                  grid_square.distance := distance;
               else
                  null;
               end if;
               count := count + 1;
            end loop;
            new_grid (X, Y) := grid_square;
         end loop;
      end loop;

      return new_grid;

   end get_parsed_grid;

   function parse_coords (coords : in Coord.CoordVector.Vector) return GridType is
      bounds : Coord.Box;
   begin

      bounds := Coord.GetBounds (coords);

      bounds.min.x := bounds.min.x - 1;
      bounds.min.y := bounds.min.y - 1;
      bounds.max.x := bounds.max.x + 1;
      bounds.max.y := bounds.max.y + 1;

      return get_parsed_grid (bounds, coords);

   end parse_coords;

   procedure print (to_print : GridType) is
   begin
      for Y in Integer range to_print'Range (2) loop
         for X in Integer range to_print'Range (1) loop
            --  Ada.Integer_Text_IO.Put (X, Width => 0);
            --  Ada.Text_IO.Put (",");
            --  Ada.Integer_Text_IO.Put (Y, Width => 0);
            Ada.Integer_Text_IO.Put (to_print (X, Y).distance, Width => 3);
         end loop;
         Ada.Text_IO.Put_Line ("");
      end loop;
   end print;

end Grid;
