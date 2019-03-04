with Ada.Integer_Text_IO;
with Ada.Text_IO;

with get_stdin;
with Types;
with Activity;
with Guard;

procedure d4_2 is

   v : Activity.ActivityRecord;
   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   activities : Activity.ActivityVector.Vector;
   guard_activity_map : Guard.GuardActivityMap.Map;
   minute_and_frequency : Activity.MinuteFrequencyTuple;

   minute_and_frequency_most_asleep : Activity.MinuteFrequencyTuple := (min => 0, freq => -1);

   GuardMostAsleep : Integer;
begin
   for I in stdin_arr'Range loop
      v := Activity.FromString (stdin_arr (I));
      activities.Append (v);
   end loop;

   Activity.Sorter.Sort (Container => activities);

   guard_activity_map := Guard.ParseGuardActivities (activities);

   Guard.PrintActivityMap (guard_activity_map);

   for C in guard_activity_map.Iterate loop

      minute_and_frequency := Activity.GetMostFrequentMinuteAsleep (Guard.GuardActivityMap.Element (C));

      if minute_and_frequency.freq > minute_and_frequency_most_asleep.freq then
         minute_and_frequency_most_asleep := minute_and_frequency;
         GuardMostAsleep := Guard.GuardActivityMap.Key (C);
      end if;
   end loop;

   Ada.Integer_Text_IO.Put (minute_and_frequency_most_asleep.min, Width => 0);
   Ada.Text_IO.Put_Line ("");

   Ada.Integer_Text_IO.Put (GuardMostAsleep, Width => 0);
   Ada.Text_IO.Put_Line ("");

   Ada.Integer_Text_IO.Put (minute_and_frequency_most_asleep.min * GuardMostAsleep, Width => 0);
   Ada.Text_IO.Put_Line ("");

end d4_2;
