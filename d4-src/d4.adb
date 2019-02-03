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
   MostFrequentMinuteAsleep: Integer := 0;

   procedure PrintMinutesAsleep(GuardActivityMap : Guard.GuardActivityMap.Map) is
      ActivityMapCursor: Guard.GuardActivityMap.Cursor := Guard.GuardActivityMap.First(GuardActivityMap);
   begin
      while Guard.GuardActivityMap.Has_Element(ActivityMapCursor) loop
         Ada.Text_IO.Put("Guard #");
         Ada.Integer_Text_IO.Put(Guard.GuardActivityMap.Key(ActivityMapCursor), Width => 0);
         Ada.Text_IO.Put(": ");
         Ada.Integer_Text_IO.Put(
            Activity.GetMinutesAsleep(Guard.GuardActivityMap.Element(ActivityMapCursor)),
            Width => 0
         );
         Ada.Text_IO.Put_Line("");
         Guard.GuardActivityMap.Next(ActivityMapCursor);
      end loop;
   end;

   function GetHighestMinutesAsleepGuardID(GuardActivityMap : Guard.GuardActivityMap.Map) return Integer is
      ActivityMapCursor: Guard.GuardActivityMap.Cursor := Guard.GuardActivityMap.First(GuardActivityMap);
      ID : Integer := -1;
      ThisMinutesAsleep : Integer;
      Maximum : Integer := -1;
   begin
      while Guard.GuardActivityMap.Has_Element(ActivityMapCursor) loop
         ThisMinutesAsleep := Activity.GetMinutesAsleep(Guard.GuardActivityMap.Element(ActivityMapCursor));
         if Maximum < ThisMinutesAsleep then
            Maximum := ThisMinutesAsleep;
            ID := Guard.GuardActivityMap.Key(ActivityMapCursor);
         end if;
         Guard.GuardActivityMap.Next(ActivityMapCursor);
      end loop;
      return ID;
   end;

   function GetMostFrequentMinuteAsleep(GuardsActivities: Activity.ActivityVector.Vector) return Integer is
      AwakeActivity: Activity.ActivityRecord;
      AsleepActivity: Activity.ActivityRecord;
      ActivityCursor: Activity.ActivityVector.Cursor := Activity.ActivityVector.First(GuardsActivities);
      StartMinute : Integer;
      EndMinute : Integer;
      MinuteCounter: Types.IntegerArray(0..59) := (others => 0);
   begin
      Activity.ActivityVector.Next(ActivityCursor);
      while Activity.ActivityVector.Has_Element(ActivityCursor) loop
         AsleepActivity := Activity.ActivityVector.Element(ActivityCursor);
         Activity.ActivityVector.Next(ActivityCursor);
         if not Activity.ActivityVector.Has_Element(ActivityCursor) then
            exit;
         end if;
         AwakeActivity := Activity.ActivityVector.Element(ActivityCursor);
         Activity.ActivityVector.Next(ActivityCursor);

         StartMinute := Activity.GetMinute(AsleepActivity);
         EndMinute := Activity.GetMinute(AwakeActivity) - 1;

         for I in Integer range StartMinute .. EndMinute loop
            MinuteCounter(I) := MinuteCounter(I) + 1;
         end loop;
      end loop;
      return Types.MaximumIndex(MinuteCounter);
   end;
   
begin
   for I in StdinArr'Range loop
      v := Activity.From_String(StdinArr(I));
      Activities.Append(v);
   end loop;

   Activity.Sorter.Sort(Container => Activities);

   -- for I in StdinArr'Range loop
   --    Activity.Print(Activities(I));
   -- end loop;

   GuardActivityMap := Guard.ParseGuardActivities(Activities);
   -- Guard.PrintActivityMap(GuardActivityMap);

   PrintMinutesAsleep(GuardActivityMap);

   HighestMinutesAsleepGuardID := GetHighestMinutesAsleepGuardID(GuardActivityMap);

   Ada.Integer_Text_IO.Put(HighestMinutesAsleepGuardID, width => 0);
   Ada.Text_IO.Put_Line("");

   MostFrequentMinuteAsleep := GetMostFrequentMinuteAsleep(GuardActivityMap(HighestMinutesAsleepGuardID));

   Ada.Integer_Text_IO.Put(MostFrequentMinuteAsleep, width => 0);
   Ada.Text_IO.Put_Line("");

   Ada.Integer_Text_IO.Put(MostFrequentMinuteAsleep * HighestMinutesAsleepGuardID, width => 0);
   Ada.Text_IO.Put_Line("");

end;
