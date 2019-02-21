with Ada.Text_IO;
with Ada.Integer_Text_IO;

with get_stdin;
with Types;

procedure d1 is
   stdin_arr : constant Types.IntegerArray := get_stdin.get_ints;
   frequency : Integer := 0;
begin
   for I in stdin_arr'Range loop
      frequency := frequency + stdin_arr (I);
   end loop;
   Ada.Integer_Text_IO.Put (frequency, Width => 0); Ada.Text_IO.Put_Line ("");
end d1;
