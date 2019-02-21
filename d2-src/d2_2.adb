with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;

with get_stdin;
with Types;

with d2util;

procedure d2_2 is

   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   result : d2util.StringPair := (
      valid => False,
      A => Ada.Strings.Unbounded.Null_Unbounded_String,
      B => Ada.Strings.Unbounded.Null_Unbounded_String
   );
begin
   for i in stdin_arr'Range loop

      result := d2util.diff_str_with_array (stdin_arr (i), stdin_arr (i .. stdin_arr'Last));

      if result.valid then
         exit;
      end if;
   end loop;

   Ada.Text_IO.Unbounded_IO.Put_Line (result.A);
   Ada.Text_IO.Unbounded_IO.Put_Line (result.B);
end d2_2;
