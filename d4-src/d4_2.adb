with Ada.Strings.Unbounded;
with Ada.Integer_Text_IO;
with Ada.Text_IO;

with get_stdin;
with Types;
with Activity;
with Guard;

procedure d4_2 is

   package UStr renames Ada.Strings.Unbounded;

   v : Activity.ActivityRecord;
   StdinArr : Types.StringArray := get_stdin.get_strs;
   Activities : Activity.ActivityVector.Vector;
   GuardActivityMap : Guard.GuardActivityMap.Map;
   GuardActivityCursor: Guard.GuardActivityMap.Cursor;
   MinuteAndFrequency: Activity.MinuteFrequencyTuple;
   MinuteAndFrequencyMostAsleep: Activity.MinuteFrequencyTuple := (min => 0, freq=>-1);
   GuardMostAsleep: Integer;
begin
    for I in StdinArr'Range loop
      v := Activity.From_String(StdinArr(I));
      Activities.Append(v);
   end loop;

   Activity.Sorter.Sort(Container => Activities);

   GuardActivityMap := Guard.ParseGuardActivities(Activities);

   Guard.PrintActivityMap(GuardActivityMap);

   GuardActivityCursor := Guard.GuardActivityMap.First(GuardActivityMap);

   while Guard.GuardActivityMap.Has_Element(GuardActivityCursor) loop
      MinuteAndFrequency := Activity.GetMostFrequentMinuteAsleep(Guard.GuardActivityMap.Element(GuardActivityCursor));
      if MinuteAndFrequency.freq > MinuteAndFrequencyMostAsleep.freq then
         MinuteAndFrequencyMostAsleep := MinuteAndFrequency;
         GuardMostAsleep := Guard.GuardActivityMap.Key(GuardActivityCursor);
      end if;
      Guard.GuardActivityMap.Next(GuardActivityCursor);
   end loop;

   Ada.Integer_Text_IO.Put(MinuteAndFrequencyMostAsleep.min, width => 0);
   Ada.Text_IO.Put_Line("");

   Ada.Integer_Text_IO.Put(GuardMostAsleep, width => 0);
   Ada.Text_IO.Put_Line("");

   Ada.Integer_Text_IO.Put(MinuteAndFrequencyMostAsleep.min * GuardMostAsleep, width => 0);
   Ada.Text_IO.Put_Line("");

end;
