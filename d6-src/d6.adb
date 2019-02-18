with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Coord;
with Types;
with get_stdin;

procedure d6 is

   package UStr renames Ada.Strings.Unbounded;

   StdinArr : Types.StringArray := get_stdin.get_strs;
   Coords : Coord.CoordVector.Vector;
begin
   for I in StdinArr'Range loop
      Coords.Append(Coord.From_String(UStr.To_String(StdinArr(I))));
   end loop;

   for C: Coord.Coordinate of Coords loop
      Ada.Text_IO.Put_Line(Coord.To_String(C));
   end loop;

end;
