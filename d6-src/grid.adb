package body Grid is

   function parse_coords (coords : in Coord.CoordVector.Vector) return GridType is
      grid_square : Grid.GridSquare;
      new_grid : Grid.GridType (0 .. 1, 0 .. 1);
      bounds : Coord.Box;
      count : Integer := 0;
      distance : Integer;

   begin

      bounds := Coord.GetBounds (coords);

      bounds.min.x := bounds.min.x - 1;
      bounds.min.y := bounds.min.y - 1;
      bounds.max.x := bounds.max.x + 1;
      bounds.max.y := bounds.max.y + 1;

      new_grid := new Grid.GridType (bounds.min.x .. bounds.max.x, bounds.min.y .. bounds.max.y);

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
   end parse_coords;

   procedure print (to_print : GridType) is
   begin
      null;
   end print;

end Grid;
