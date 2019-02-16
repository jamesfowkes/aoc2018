procedure d4 is

   package UStr renames Ada.Strings.Unbounded;

   StdinArr : Types.StringArray := get_stdin.get_strs;

begin
   for I in StdinArr'Range loop
      Claims.Append(Claim.From_String(StdinArr(I)));
   end loop;
end;
