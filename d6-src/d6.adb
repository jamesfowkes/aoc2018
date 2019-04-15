with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

with Coord;
with Grid;
with Types;
with get_stdin;

procedure d6 is

   package UStr renames Ada.Strings.Unbounded;

   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   coords : Coord.CoordVector.Vector;

begin

   for I in stdin_arr'Range loop
      coords.Append (Coord.From_String (UStr.To_String (stdin_arr (I))));
   end loop;

   for C : Coord.Coordinate of coords loop
      Ada.Text_IO.Put_Line (Coord.To_String (C));
   end loop;

   declare
      new_grid : constant Grid.GridType := Grid.parse_coords (coords);
   begin
      Ada.Text_IO.Put ("Got a ");
      Ada.Integer_Text_IO.Put (new_grid'Last (1), Width => 0);
      Ada.Text_IO.Put ("x");
      Ada.Integer_Text_IO.Put (new_grid'Last (2), Width => 0);
      Ada.Text_IO.Put_Line (" grid");

      Grid.print (new_grid);
   end;

end d6;
