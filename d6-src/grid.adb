with Ada.Text_IO;
with Ada.Integer_Text_IO;
--  with Ada.Characters;
--  with Ada.Characters.Handling;

package body Grid is

   function get_grid_from_bounds (bounds : Coord.Box) return GridType is
   begin
      declare
         NewGrid : constant Grid.GridType (bounds.min.x .. bounds.max.x, bounds.min.y .. bounds.max.y) :=
           (others => (others => ('.', 0)));
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
            grid_square.coord_letter := '.';
            grid_square.distance := Natural'Last;
            count := 0;
            for C : Coord.Coordinate of coords loop
               distance := Coord.Manhattan (C, X, Y);
               if distance < grid_square.distance then
                  grid_square.coord_letter := Character'Val (count + 65);
                  grid_square.distance := distance;
               elsif distance = grid_square.distance then
                  grid_square.coord_letter := '.';
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

   procedure print_square (to_print : GridSquare) is
   begin
      if to_print.coord_letter = '.' then
         Ada.Text_IO.Put (".");
      elsif to_print.distance = 0 then
         Ada.Text_IO.Put (to_print.coord_letter);
      else
         Ada.Text_IO.Put (to_print.coord_letter);
      end if;
   end print_square;

   procedure print (to_print : GridType) is
   begin
      for Y in Integer range to_print'Range (2) loop
         for X in Integer range to_print'Range (1) loop
            Grid.print_square (to_print (X, Y));
         end loop;
         Ada.Text_IO.Put_Line ("");
      end loop;
   end print;

   function find_border_chars (to_search : GridType) return utils.CharacterVector.Vector is
      xmin : constant Integer := to_search'First (1) + 1;
      ymin : constant Integer := to_search'First (2) + 1;
      xmax : constant Integer := to_search'Last (1) - 1;
      ymax : constant Integer := to_search'Last (2) - 1;
      exclude : utils.CharacterVector.Vector;
   begin
      --  Search top row
      for X in Integer range to_search'Range (1) loop
         if not utils.char_in_vector (to_search (X, ymin).coord_letter, exclude) then
            exclude.Append (to_search (X, ymin).coord_letter);
         end if;
      end loop;

      --  Search bottom row
      for X in Integer range to_search'Range (1) loop
         if not utils.char_in_vector (to_search (X, ymax).coord_letter, exclude) then
            exclude.Append (to_search (X, ymax).coord_letter);
         end if;
      end loop;

      --  Search left column
      for Y in Integer range to_search'Range (2) loop
         if not utils.char_in_vector (to_search (xmin, Y).coord_letter, exclude) then
            exclude.Append (to_search (xmin, Y).coord_letter);
         end if;
      end loop;

      --  Search right column
      for Y in Integer range to_search'Range (2) loop
         if not utils.char_in_vector (to_search (xmax, Y).coord_letter, exclude) then
            exclude.Append (to_search (xmax, Y).coord_letter);
         end if;
      end loop;

      return exclude;

   end find_border_chars;

   function find_largest_area (to_search : GridType) return GridArea is
      xmin : constant Integer := to_search'First (1) + 1;
      ymin : constant Integer := to_search'First (2) + 1;
      xmax : constant Integer := to_search'Last (1) - 1;
      ymax : constant Integer := to_search'Last (2) - 1;
      count_map : NearestSquareToCountMap.Map;
      largest_area : GridArea := (coord_letter => '.', area => 0);
      coord_letter : Character;
      exclude : constant utils.CharacterVector.Vector := find_border_chars (to_search);
   begin

      for Y in Integer range ymin .. ymax loop
         for X in Integer range xmin .. xmax loop
            coord_letter := to_search (X, Y).coord_letter;
            if coord_letter /= '.' then
               if not utils.char_in_vector (coord_letter, exclude) then
                  if not count_map.Contains (coord_letter) then
                     count_map.Insert (coord_letter, New_Item => 0);
                  else
                     count_map (coord_letter) := count_map (coord_letter) + 1;
                  end if;
               end if;
            end if;
         end loop;
      end loop;

      for C in NearestSquareToCountMap.Iterate (count_map) loop
         coord_letter := NearestSquareToCountMap.Key (C);
         Ada.Text_IO.Put (coord_letter);
         Ada.Text_IO.Put (" = ");
         Ada.Integer_Text_IO.Put (NearestSquareToCountMap.Element (C));
         Ada.Text_IO.Put_Line ("");

         if NearestSquareToCountMap.Element (C) > largest_area.area then
            largest_area.coord_letter := coord_letter;
            largest_area.area := NearestSquareToCountMap.Element (C);
         end if;
      end loop;
      return largest_area;
   end find_largest_area;
end Grid;
