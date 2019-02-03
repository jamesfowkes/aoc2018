with Ada.Calendar;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

package Activity is

   package UStr renames Ada.Strings.Unbounded;

   type ActivityRecord is 
   record
      dt: Ada.Calendar.Time;
      str: UStr.Unbounded_String;
   end record;

   package ActivityVector is new Ada.Containers.Vectors
      (Element_Type => ActivityRecord,
      Index_Type => Natural);

   function From_String(s: in UStr.Unbounded_String) return ActivityRecord;
   function IsChangeOfGuard(a: in ActivityRecord) return Boolean;
   function GetGuardID(a: in ActivityRecord) return Integer;
   function GetMinutesAsleep(activities: in ActivityVector.Vector) return Integer;

   procedure Print(a :in ActivityRecord);
   procedure Print(v :in ActivityVector.Vector);

   function "<" (L, R : ActivityRecord) return Boolean;
   
   package Sorter is new ActivityVector.Generic_Sorting;

end Activity;
