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
   MinuteAndFrequency : Activity.MinuteFrequencyTuple;

   MinuteAndFrequencyMostAsleep : Activity.MinuteFrequencyTuple := (min => 0, freq => -1);

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

      MinuteAndFrequency := Activity.GetMostFrequentMinuteAsleep (Guard.GuardActivityMap.Element (C));

      if MinuteAndFrequency.freq > MinuteAndFrequencyMostAsleep.freq then
         MinuteAndFrequencyMostAsleep := MinuteAndFrequency;
         GuardMostAsleep := Guard.GuardActivityMap.Key (C);
      end if;
   end loop;

   Ada.Integer_Text_IO.Put (MinuteAndFrequencyMostAsleep.min, Width => 0);
   Ada.Text_IO.Put_Line ("");

   Ada.Integer_Text_IO.Put (GuardMostAsleep, Width => 0);
   Ada.Text_IO.Put_Line ("");

   Ada.Integer_Text_IO.Put (MinuteAndFrequencyMostAsleep.min * GuardMostAsleep, Width => 0);
   Ada.Text_IO.Put_Line ("");

end d4_2;
