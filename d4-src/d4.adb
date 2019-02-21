with Ada.Text_IO;
with Ada.Integer_Text_IO;

with get_stdin;
with Types;
with Activity;
with Guard;

procedure d4 is

   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   v : Activity.ActivityRecord;
   activities : Activity.ActivityVector.Vector;
   guard_activity_map : Guard.GuardActivityMap.Map;
   highest_minutes_asleep_guard_ID : Integer := 0;
   most_frequency_minute_asleep : Activity.MinuteFrequencyTuple;

begin
   for I in stdin_arr'Range loop
      v := Activity.FromString (stdin_arr (I));
      activities.Append (v);
   end loop;

   Activity.Sorter.Sort (Container => activities);

   guard_activity_map := Guard.ParseGuardActivities (activities);

   --  Guard.PrintActivityMap (guard_activity_map);
   --  Guard.PrintMinutesAsleep (guard_activity_map);

   highest_minutes_asleep_guard_ID :=
      Guard.GetHighestMinutesAsleepGuardID (guard_activity_map);

   Ada.Integer_Text_IO.Put (highest_minutes_asleep_guard_ID, Width => 0);
   Ada.Text_IO.Put_Line ("");

   most_frequency_minute_asleep := Activity.GetMostFrequentMinuteAsleep (
      guard_activity_map (highest_minutes_asleep_guard_ID));

   Ada.Integer_Text_IO.Put (most_frequency_minute_asleep.min, Width => 0);
   Ada.Text_IO.Put_Line ("");

   Ada.Integer_Text_IO.Put (most_frequency_minute_asleep.min * highest_minutes_asleep_guard_ID, Width => 0);
   Ada.Text_IO.Put_Line ("");

end d4;
