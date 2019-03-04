with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Coord;
with Types;
with get_stdin;

procedure d6 is

   package UStr renames Ada.Strings.Unbounded;

   type GridSquare is
   record
      coord_index : Integer;
      distance : Integer;
   end record;

   type GridType is array (Integer range <>, Integer range <>) of GridSquare;

   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   coords : Coord.CoordVector.Vector;

   low_x : Integer := Integer'Last;
   low_y : Integer := Integer'Last;
   high_x : Integer := Integer'First;
   high_y : Integer := Integer'First;
   grid : access GridType;
   grid_square: GridSquare;
   grid_coord : Coord.Coordinate;
begin

   for I in stdin_arr'Range loop
      coords.Append (Coord.From_String (UStr.To_String (stdin_arr (I))));
   end loop;

   for C : Coord.Coordinate of coords loop
      Ada.Text_IO.Put_Line (Coord.To_String (C));
      low_x := Integer'Min (C.x, low_x);
      low_y := Integer'Min (C.y, low_y);
      high_x := Integer'Max (C.x, high_x);
      high_y := Integer'Max (C.y, high_y);
   end loop;

   low_x := low_x - 1;
   low_y := low_y - 1;
   high_x := high_x + 1;
   high_y := high_y + 1;

   grid := new GridType (low_x .. high_x, low_y .. high_y);
   for X in Integer range low_x .. high_x loop
      for Y in Integer range low_y .. high_y loop
         grid_square.coord_index := -1;
         grid_square.distance := Natural'Last;
         for C : Coord.Coordinate of coords loop
            grid_coord.x = X;
            grid_coord.y = Y;
            if C.Manhattan
         end loop;
      end loop;
   end loop;
end d6;
