with Ada.Integer_Text_IO;
with Ada.Text_IO;
with Ada.Calendar.Arithmetic;

package body Activity is

   use ActivityVector;

   function FromString (s : in UStr.Unbounded_String) return ActivityRecord is
      year : Integer := 0;
      month : Integer := 0;
      date : Integer := 0;
      hour : Integer := 0;
      minute : Integer := 0;
      seconds : Duration := 0.0;
      activity : ActivityRecord;
   begin
      --  Activity structure: [1518-03-08 00:49] <activity string>

      --  Adding 400 brings integer into range of Ada.Calendar.Year_Number
      year := Integer'Value (UStr.Slice (s, 2, 5)) + 400;
      month := Integer'Value (UStr.Slice (s, 7, 8));
      date := Integer'Value (UStr.Slice (s, 10, 11));
      hour := Integer'Value (UStr.Slice (s, 13, 14));
      minute := Integer'Value (UStr.Slice (s, 16, 17));
      seconds :=  (hour * 60.0 * 60.0) +  (minute * 60.0);

      activity.dt := Ada.Calendar.Time_Of (year, month, date, seconds);
      activity.str := UStr.To_Unbounded_String (
         UStr.Slice (s, 20, UStr.Length (s)));

      return activity;
   end FromString;

   function IsChangeOfGuard (a : in ActivityRecord) return Boolean is
   begin
      --  Text is e.g. "Guard #2927 begins shift"
      return UStr.Slice (a.str, 1, 5) = "Guard";
   end IsChangeOfGuard;

   function GetGuardID (a : in ActivityRecord) return Integer is
      id : Integer := -1;
   begin
      if IsChangeOfGuard (a) then
         --  Text is e.g. "Guard #2927 begins shift"
         id := Integer'Value (UStr.Slice (a.str, 8, 11));
      end if;
      return id;
   end GetGuardID;

   function GetNextSleepPeriod (
      ActivityCursor : in out ActivityVector.Cursor; ThisSleepPeriod : out SleepPeriod) return Boolean is

      AwakeActivity : ActivityRecord;
      AsleepActivity : ActivityRecord;
   begin
      ActivityVector.Next (ActivityCursor);
      if ActivityVector.Has_Element (ActivityCursor) then
         AsleepActivity := ActivityVector.Element (ActivityCursor);
         ActivityVector.Next (ActivityCursor);
         if ActivityVector.Has_Element (ActivityCursor) then
            AwakeActivity := ActivityVector.Element (ActivityCursor);
            ThisSleepPeriod.asleep := AsleepActivity;
            ThisSleepPeriod.awake := AwakeActivity;
            return True;
         end if;
      end if;
      return False;
   end GetNextSleepPeriod;

   function GetMinutesAsleep (activities : in ActivityVector.Vector) return Integer is

      ThisSleepPeriod : SleepPeriod;
      MinutesAsleep : Integer := 0;
      DiffDays : Ada.Calendar.Arithmetic.Day_Count;
      DiffSeconds : Duration;
      DiffLeapSeconds : Ada.Calendar.Arithmetic.Leap_Seconds_Count;
      ActivityCursor : ActivityVector.Cursor :=
         ActivityVector.First (activities);
   begin
      while GetNextSleepPeriod (ActivityCursor, ThisSleepPeriod) loop
         Ada.Calendar.Arithmetic.Difference (
            ThisSleepPeriod.awake.dt,
            ThisSleepPeriod.asleep.dt,
            DiffDays, DiffSeconds, DiffLeapSeconds
         );
         MinutesAsleep := MinutesAsleep + Integer (DiffSeconds);
      end loop;
      return MinutesAsleep / 60;
   end GetMinutesAsleep;

   function GetMinute (a : in ActivityRecord) return Integer is
   begin
      return Integer (Ada.Calendar.Seconds (a.dt) / 60);
   end GetMinute;

   function GetSleepFrequencyPerMinute (GuardsActivities : in Activity.ActivityVector.Vector
   ) return Types.IntegerArray is
      ThisSleepPeriod : SleepPeriod;

      ActivityCursor : Activity.ActivityVector.Cursor := Activity.ActivityVector.First (GuardsActivities);

      StartMinute : Integer;
      EndMinute : Integer;
      MinuteCounter : Types.IntegerArray (0 .. 59) :=  (others => 0);
   begin
      while GetNextSleepPeriod (ActivityCursor, ThisSleepPeriod) loop
         StartMinute := Activity.GetMinute (ThisSleepPeriod.asleep);
         EndMinute := Activity.GetMinute (ThisSleepPeriod.awake) - 1;

         for I in Integer range StartMinute .. EndMinute loop
            MinuteCounter (I) := MinuteCounter (I) + 1;
         end loop;
      end loop;
      return MinuteCounter;
   end GetSleepFrequencyPerMinute;

   function GetMostFrequentMinuteAsleep (GuardsActivities : in Activity.ActivityVector.Vector)
      return MinuteFrequencyTuple is

      MinuteAndFrequency : MinuteFrequencyTuple;
      ArrayMaximum : Types.ArrayLocationTuple;
   begin
      ArrayMaximum := Types.Maximum (GetSleepFrequencyPerMinute (GuardsActivities));

      MinuteAndFrequency.min := ArrayMaximum.loc;
      MinuteAndFrequency.freq := ArrayMaximum.val;
      return MinuteAndFrequency;
   end GetMostFrequentMinuteAsleep;

   procedure Print (a : in ActivityRecord) is
      s : Ada.Calendar.Day_Duration := 0.0;
      h : Integer := 0;
      m : Integer := 0;
   begin
      Ada.Text_IO.Put ("[");
      Ada.Integer_Text_IO.Put (Ada.Calendar.Year (a.dt) - 400, Width => 0);
      Ada.Text_IO.Put ("-");
      if Ada.Calendar.Month (a.dt) < 10 then
         Ada.Text_IO.Put ("0");
      end if;
      Ada.Integer_Text_IO.Put (Ada.Calendar.Month (a.dt), Width => 0);
      Ada.Text_IO.Put ("-");
      if Ada.Calendar.Day (a.dt) < 10 then
         Ada.Text_IO.Put ("0");
      end if;
      Ada.Integer_Text_IO.Put (Ada.Calendar.Day (a.dt), Width => 0);

      Ada.Text_IO.Put (" ");

      s := Ada.Calendar.Seconds (a.dt);
      h := Integer (s) / 3600;
      m :=  (Integer (s) -  (h * 3600)) / 60;
      if h < 10 then
         Ada.Text_IO.Put ("0");
      end if;
      Ada.Integer_Text_IO.Put (h, Width => 0);
      Ada.Text_IO.Put (":");
      if m < 10 then
         Ada.Text_IO.Put ("0");
      end if;
      Ada.Integer_Text_IO.Put (m, Width => 0);
      Ada.Text_IO.Put (":00] ");

      Ada.Text_IO.Put_Line (UStr.To_String (a.str));
   end Print;

   procedure Print (v : in ActivityVector.Vector) is
      C : ActivityVector.Cursor := v.First;
   begin
      loop
         exit when C = ActivityVector.No_Element;
         Print (Element (C));
         C := ActivityVector.Next (C);
      end loop;
   end Print;

   function "<" (L, R : ActivityRecord) return Boolean is
   begin
      return Ada.Calendar."<" (L.dt, R.dt);
   end "<";

end Activity;
