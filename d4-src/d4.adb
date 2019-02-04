with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

with get_stdin;
with Types;
with Activity;
with Guard;
with utils;

procedure d4 is

   package UStr renames Ada.Strings.Unbounded;

   StdinArr : Types.StringArray := get_stdin.get_strs;
   v : Activity.ActivityRecord;
   Activities : Activity.ActivityVector.Vector;
   GuardActivityMap : Guard.GuardActivityMap.Map;
   HighestMinutesAsleepGuardID : Integer := 0;
   MostFrequentMinuteAsleep: Activity.MinuteFrequencyTuple;
   
begin
   for I in StdinArr'Range loop
      v := Activity.From_String(StdinArr(I));
      Activities.Append(v);
   end loop;

   Activity.Sorter.Sort(Container => Activities);

   GuardActivityMap := Guard.ParseGuardActivities(Activities);

   Guard.PrintMinutesAsleep(GuardActivityMap);

   HighestMinutesAsleepGuardID := Guard.GetHighestMinutesAsleepGuardID(GuardActivityMap);

   Ada.Integer_Text_IO.Put(HighestMinutesAsleepGuardID, width => 0);
   Ada.Text_IO.Put_Line("");

   MostFrequentMinuteAsleep := Activity.GetMostFrequentMinuteAsleep(GuardActivityMap(HighestMinutesAsleepGuardID));

   Ada.Integer_Text_IO.Put(MostFrequentMinuteAsleep.min, width => 0);
   Ada.Text_IO.Put_Line("");

   Ada.Integer_Text_IO.Put(MostFrequentMinuteAsleep.min * HighestMinutesAsleepGuardID, width => 0);
   Ada.Text_IO.Put_Line("");

end;
