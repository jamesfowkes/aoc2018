with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers.Hashed_Maps;

with Activity;

use type Activity.ActivityVector.Vector;

package body Guard is
   
   use GuardActivityMap;

   function ParseGuardActivities(AllActivities: in Activity.ActivityVector.Vector) return GuardActivityMap.Map is
      map: GuardActivityMap.Map;
      CurrentGuardID: Integer := -1;
      CurrentActivities : Activity.ActivityVector.Vector;
   begin
      for I in AllActivities.First_Index .. AllActivities.Last_Index loop
         
         if Activity.IsChangeOfGuard(AllActivities(I)) then
            if CurrentGuardID /= -1 then
               if not map.Contains(CurrentGuardID) then
                  map.Insert(CurrentGuardID, New_Item => CurrentActivities);
               else
                  map.Replace(CurrentGuardID, New_Item => CurrentActivities);
               end if;
               Activity.ActivityVector.Clear(CurrentActivities);
               CurrentActivities.Append(AllActivities(I));
            end if;

            CurrentGuardID := Activity.GetGuardID(AllActivities(I));
            if map.Contains(CurrentGuardID) then
               CurrentActivities := map(CurrentGuardID);
            end if;
         else
            CurrentActivities.Append(AllActivities(I));
         end if;            
      end loop;
      return map;
   end ParseGuardActivities;

   function GetSleepDurations(GuardActivities: in GuardActivityMap.Map) return GuardDurationMap.Map is
      map: GuardDurationMap.Map;
   begin
      return map;
   end;
   procedure PrintActivityMap(Map: in GuardActivityMap.Map) is
      C: GuardActivityMap.Cursor := Map.First;
   begin
      loop
         exit when C = GuardActivityMap.No_Element;
         Activity.Print(Element(C));
         C := GuardActivityMap.Next(C);
      end loop;
   end PrintActivityMap;

   procedure PrintMinutesAsleep(GuardActivityMap : Guard.GuardActivityMap.Map) is
   begin
      for C in GuardActivityMap.Iterate loop
         Ada.Text_IO.Put("Guard #");
         Ada.Integer_Text_IO.Put(Guard.GuardActivityMap.Key(C), Width => 0);
         Ada.Text_IO.Put(": ");
         Ada.Integer_Text_IO.Put(
            Activity.GetMinutesAsleep(Guard.GuardActivityMap.Element(C)),
            Width => 0
         );
         Ada.Text_IO.Put_Line("");
      end loop;
   end;

   function GetHighestMinutesAsleepGuardID(GuardActivityMap : Guard.GuardActivityMap.Map) return Integer is
      ID : Integer := -1;
      ThisMinutesAsleep : Integer;
      Maximum : Integer := -1;
   begin
      for C in GuardActivityMap.Iterate loop
         ThisMinutesAsleep := Activity.GetMinutesAsleep(Guard.GuardActivityMap.Element(C));
         if Maximum < ThisMinutesAsleep then
            Maximum := ThisMinutesAsleep;
            ID := Guard.GuardActivityMap.Key(C);
         end if;
      end loop;
      return ID;
   end;

end Guard;
