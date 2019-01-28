with Ada.Integer_Text_IO;
with Ada.Text_IO;
with Ada.Containers.Vectors;

package body Activity is

   function From_String(s: in UStr.Unbounded_String) return ActivityRecord is
      year: Integer := 0;
      month: Integer := 0;
      date: Integer := 0;
      hour: Integer := 0;
      minute: Integer := 0;
      seconds: Duration := 0.0;
      activity: ActivityRecord;
   begin
      --  Activity structure: [1518-03-08 00:49] <activity string>

      -- Adding 400 brings integer into range of Ada.Calendar.Year_Number
      year := Integer'Value(UStr.Slice(s, 2, 5)) + 400;
      month := Integer'Value(UStr.Slice(s, 7, 8));
      date := Integer'Value(UStr.Slice(s, 10, 11));
      hour := Integer'Value(UStr.Slice(s, 13, 14));
      minute := Integer'Value(UStr.Slice(s, 16, 17));
      seconds := (hour * 60.0 * 60.0) + (minute * 60.0);

      activity.dt := Ada.Calendar.Time_Of(year, month, date, seconds);
      activity.str := UStr.To_Unbounded_String(UStr.slice(s, 20, UStr.Length(s)));

      return activity;
   end From_String;

   procedure Print(a :in ActivityRecord) is
      s : Ada.Calendar.Day_Duration := 0.0;
      h : Integer := 0;
      m : Integer := 0;
   begin
      Ada.Text_IO.Put("[");
      Ada.Integer_Text_IO.Put(Ada.Calendar.Year(a.dt)-400, width => 0);
      Ada.Text_IO.Put("-");
      if Ada.Calendar.Month(a.dt) < 10 then
          Ada.Text_IO.Put("0");
      end if;
      Ada.Integer_Text_IO.Put(Ada.Calendar.Month(a.dt), width => 0);
      Ada.Text_IO.Put("-");
      if Ada.Calendar.Day(a.dt) < 10 then
          Ada.Text_IO.Put("0");
      end if;
      Ada.Integer_Text_IO.Put(Ada.Calendar.Day(a.dt), width => 0);

      Ada.Text_IO.Put(" ");

      s := Ada.Calendar.Seconds(a.dt);
      h := Integer(s) / 3600;
      m := (Integer(s) - (h * 3600)) / 60;
      if h < 10 then
          Ada.Text_IO.Put("0");
      end if;
      Ada.Integer_Text_IO.Put(h, width => 0);
      Ada.Text_IO.Put(":");
      if m < 10 then
          Ada.Text_IO.Put("0");
      end if;
      Ada.Integer_Text_IO.Put(m, width => 0);
      Ada.Text_IO.Put(":00] ");

      Ada.Text_IO.Put_Line(UStr.To_String(a.str));
   end Print;

   function "<" (L, R : ActivityRecord) return Boolean is
   begin
      return Ada.Calendar."<"(L.dt, R.dt);
   end "<";

end Activity;
