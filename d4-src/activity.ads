with Ada.Calendar;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

with Types;

package Activity is

   package UStr renames Ada.Strings.Unbounded;

   type ActivityRecord is
   record
      dt : Ada.Calendar.Time;
      str : UStr.Unbounded_String;
   end record;

   type SleepPeriod is
   record
      asleep : ActivityRecord;
      awake : ActivityRecord;
   end record;

   package ActivityVector is new Ada.Containers.Vectors
      (Element_Type => ActivityRecord,
      Index_Type => Natural);

   type MinuteFrequencyTuple is
   record
      min : Integer;
      freq : Integer;
   end record;

   function FromString (s : in UStr.Unbounded_String) return ActivityRecord;
   function IsChangeOfGuard (a : in ActivityRecord) return Boolean;
   function GetGuardID (a : in ActivityRecord) return Integer;

   function GetMinutesAsleep (activities : in ActivityVector.Vector) return Integer;
   function GetSleepFrequencyPerMinute (GuardsActivities : in Activity.ActivityVector.Vector)
   return Types.IntegerArray;

   function GetMostFrequentMinuteAsleep (GuardsActivities : Activity.ActivityVector.Vector)
   return MinuteFrequencyTuple;

   function GetNextSleepPeriod (
      ActivityCursor : in out ActivityVector.Cursor; ThisSleepPeriod : out SleepPeriod) return Boolean;

   function GetMinute (a : in ActivityRecord) return Integer;

   procedure Print (a : in ActivityRecord);
   procedure Print (v : in ActivityVector.Vector);

   function "<" (L, R : ActivityRecord) return Boolean;

   package Sorter is new ActivityVector.Generic_Sorting;

end Activity;
