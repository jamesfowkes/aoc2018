with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Coord;
with Grid;
with Types;
with get_stdin;

procedure d6 is

   package UStr renames Ada.Strings.Unbounded;

   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   coords : Coord.CoordVector.Vector;
   new_grid : Grid.GridType (0 .. 1,  0 .. 1);

begin

   for I in stdin_arr'Range loop
      coords.Append (Coord.From_String (UStr.To_String (stdin_arr (I))));
   end loop;

   for C : Coord.Coordinate of coords loop
      Ada.Text_IO.Put_Line (Coord.To_String (C));
   end loop;

   new_grid := Grid.parse_coords (coords);
   Grid.print (new_grid);

end d6;
