with Ada.Integer_Text_IO;
with Ada.Text_IO;

with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
with Ada.Calendar;
with get_stdin;

procedure d4 is

   package UStr renames Ada.Strings.Unbounded;

   type ActivityRecord is 
   record
      dt: Ada.Calendar.Time;
      str: UStr.Unbounded_String;
   end record;

   function GetActivityRecord(s: in UStr.Unbounded_String) return ActivityRecord is
      year: Integer := 0;
      month: Integer := 0;
      date: Integer := 0;
      hour: Integer := 0;
      minute: Integer := 0;
      seconds: Duration := 0.0;
      activity: ActivityRecord;
   begin
      --  Activity structure: [1518-03-08 00:49] <activity string>

      year := Integer'Value(UStr.Slice(s, 1, 4));
      month := Integer'Value(UStr.Slice(s, 6, 7));
      date := Integer'Value(UStr.Slice(s, 9, 10));
      hour := Integer'Value(UStr.Slice(s, 6, 8));
      minute := Integer'Value(UStr.Slice(s, 6, 8));
      seconds := (hour * 60.0 * 60.0) + (minute * 60.0);

      activity.dt := Ada.Calendar.Time_Of(year, month, date, seconds);
      activity.str := UStr.To_Unbounded_String(UStr.slice(s, 20, UStr.Length(s)));

      return activity;

   end GetActivityRecord;

   StdinArr : get_stdin.StringArray := get_stdin.get_strs;
   v : ActivityRecord;
begin
   for I in StdinArr'Range loop
      v := GetActivityRecord(StdinArr(I));
      Ada.Text_IO.Put_Line(UStr.To_String(v.str));
   end loop;
end;
