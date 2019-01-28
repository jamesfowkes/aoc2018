with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
with get_stdin;
with Activity;
procedure d4 is

   package UStr renames Ada.Strings.Unbounded;

   StdinArr : get_stdin.StringArray := get_stdin.get_strs;
   v : Activity.ActivityRecord;
   Activities : Activity.ActivityVector.Vector;
begin
   for I in StdinArr'Range loop
      v := Activity.From_String(StdinArr(I));
      Activities.Append(v);
   end loop;

   Activity.Sorter.Sort(Container => Activities);

   for I in StdinArr'Range loop
      Activity.Print(Activities(I));
   end loop;

end;
