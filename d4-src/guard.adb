with Ada.Text_IO;
with Ada.Integer_Text_IO;

with Ada.Containers.Hashed_Maps;

with Activity;

use type Activity.ActivityVector.Vector;

package body Guard is
   
   use GuardActivityMap;

   function IntegerHash(i: Integer) return Ada.Containers.Hash_Type is
   begin
       return Ada.Containers.Hash_Type(i);
   end IntegerHash;

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
            end if;

            CurrentGuardID := Activity.GetGuardID(AllActivities(I));
            Ada.Text_IO.Put("Guard #");
            Ada.Integer_Text_IO.Put(CurrentGuardID);
            if map.Contains(CurrentGuardID) then
               Ada.Text_IO.Put(" already exists with ");
               CurrentActivities := map(CurrentGuardID);
               Ada.Integer_Text_IO.Put(Integer(Activity.ActivityVector.Length(CurrentActivities)));
               Ada.Text_IO.Put_Line(" entries");
            else
               Ada.Text_IO.Put_Line(" does not exist");
            end if;
         else
            CurrentActivities.Append(AllActivities(I));
         end if;
      end loop;
      return map;
   end ParseGuardActivities;

   procedure PrintActivityMap(Map: in GuardActivityMap.Map) is
      C: GuardActivityMap.Cursor := Map.First;
   begin
      loop
         exit when C = GuardActivityMap.No_Element;
         Ada.Text_IO.Put("Guard #");
         Ada.Integer_Text_IO.Put(Key(C));
         Ada.Text_IO.Put_Line(":");
         Activity.Print(Element(C));
         C := GuardActivityMap.Next(C);
      end loop;
   end PrintActivityMap;
end Guard;