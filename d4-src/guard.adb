with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Guard is

   use GuardActivityMap;

   function ParseGuardActivities (all_activities : in Activity.ActivityVector.Vector) return GuardActivityMap.Map is

      map : GuardActivityMap.Map;
      current_guard_ID : Integer := -1;
      current_activities : Activity.ActivityVector.Vector;
   begin
      for I in all_activities.First_Index .. all_activities.Last_Index loop

         if Activity.IsChangeOfGuard (all_activities (I)) then
            if current_guard_ID /= -1 then
               if not map.Contains (current_guard_ID) then
                  map.Insert (current_guard_ID, New_Item => current_activities);
               else
                  map.Replace (current_guard_ID, New_Item => current_activities);
               end if;
               Activity.ActivityVector.Clear (current_activities);
               current_activities.Append (all_activities (I));
            end if;

            current_guard_ID := Activity.GetGuardID (all_activities (I));
            if map.Contains (current_guard_ID) then
               current_activities := map (current_guard_ID);
            end if;
         else
            current_activities.Append (all_activities (I));
         end if;
      end loop;
      return map;
   end ParseGuardActivities;

   procedure PrintActivityMap (guard_activity_map : in GuardActivityMap.Map) is
      C : GuardActivityMap.Cursor := guard_activity_map.First;
   begin
      loop
         exit when C = GuardActivityMap.No_Element;
         Activity.Print (Element (C));
         C := GuardActivityMap.Next (C);
      end loop;
   end PrintActivityMap;

   procedure PrintMinutesAsleep (guard_activity_map : Guard.GuardActivityMap.Map) is

   begin
      for C in guard_activity_map.Iterate loop
         Ada.Text_IO.Put ("Guard #");
         Ada.Integer_Text_IO.Put (Guard.GuardActivityMap.Key (C), Width => 0);
         Ada.Text_IO.Put (": ");
         Ada.Integer_Text_IO.Put (
            Activity.GetMinutesAsleep (Guard.GuardActivityMap.Element (C)),
            Width => 0
         );
         Ada.Text_IO.Put_Line ("");
      end loop;
   end PrintMinutesAsleep;

   function GetHighestMinutesAsleepGuardID (guard_activity_map : Guard.GuardActivityMap.Map) return Integer is

      guard_id : Integer := -1;
      this_minutes_asleep : Integer;
      maximum : Integer := -1;
   begin
      for C in guard_activity_map.Iterate loop
         this_minutes_asleep := Activity.GetMinutesAsleep (
            Guard.GuardActivityMap.Element (C));
         if maximum < this_minutes_asleep then
            maximum := this_minutes_asleep;
            guard_id := Guard.GuardActivityMap.Key (C);
         end if;
      end loop;
      return guard_id;
   end GetHighestMinutesAsleepGuardID;

end Guard;
