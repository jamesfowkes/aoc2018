with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Command_Line;

with Coord;
with Grid;
with Types;
with get_stdin;

procedure d6_2 is

   package UStr renames Ada.Strings.Unbounded;

   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   coords : Coord.CoordVector.Vector;
   distance_limit : Integer;
   area : Integer;
begin

   if Ada.Command_Line.Argument_Count /= 1 then
      Ada.Text_IO.Put ("Expected distance as argument 1");
      Ada.Command_Line.Set_Exit_Status (1);
      return;
   else
      distance_limit := Integer'Value (Ada.Command_Line.Argument (1));
   end if;

   for I in stdin_arr'Range loop
      coords.Append (Coord.From_String (UStr.To_String (stdin_arr (I))));
   end loop;

   for C : Coord.Coordinate of coords loop
      Ada.Text_IO.Put_Line (Coord.To_String (C));
   end loop;

   declare
      new_grid : constant Grid.GridType := Grid.parse_coords_by_distance_sum (coords, distance_limit);
   begin
      Ada.Text_IO.Put ("Got a ");
      Ada.Integer_Text_IO.Put (new_grid'Last (1) - new_grid'First (1), Width => 0);
      Ada.Text_IO.Put ("x");
      Ada.Integer_Text_IO.Put (new_grid'Last (2) - new_grid'First (2), Width => 0);
      Ada.Text_IO.Put_Line (" grid");

      Grid.print (new_grid, Grid.print_square_letter'Access);

      area := Grid.find_area_within_distance (new_grid);

      Ada.Text_IO.Put ("Area is ");
      Ada.Integer_Text_IO.Put (area, Width => 0);
      Ada.Text_IO.Put_Line (" squares");
   end;

end d6_2;
