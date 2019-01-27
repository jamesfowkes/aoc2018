with get_stdin;

procedure d4_2 is

   package UStr renames Ada.Strings.Unbounded;

   StdinArr : get_stdin.StringArray := get_stdin.get_strs;
begin
   for I in StdinArr'Range loop
   end loop;
end;
