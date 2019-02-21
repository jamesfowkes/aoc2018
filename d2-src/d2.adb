with Ada.Text_IO;
with Ada.Integer_Text_IO;

with get_stdin;
with Types;

with d2util;

procedure d2 is

   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   two_count : Integer := 0;
   three_count : Integer := 0;

begin
   for I in stdin_arr'Range loop
      if d2util.has_char_count (stdin_arr (I), 2) then
         two_count := two_count + 1;
      end if;
      if d2util.has_char_count (stdin_arr (I), 3) then
         three_count := three_count + 1;
      end if;
   end loop;
   Ada.Integer_Text_IO.Put (two_count * three_count, Width => 0);
   Ada.Text_IO.Put_Line ("");
end d2;
