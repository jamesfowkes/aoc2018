with Ada.Containers;
with Ada.Containers.Indefinite_Hashed_Maps;

with Types;
with Activity;

package Guard is
   
   package GuardActivityMap is new Ada.Containers.Indefinite_Hashed_Maps(
      Key_Type => Integer,
      Element_Type => Activity.ActivityVector.Vector,
      Hash => Types.IntegerHash,
      Equivalent_Keys => "=",
      "=" => Activity.ActivityVector."="
   );

   package GuardDurationMap renames Types.IntegerMap;

   function ParseGuardActivities(AllActivities: in Activity.ActivityVector.Vector) return GuardActivityMap.Map;
   function GetSleepDurations(GuardActivities: in GuardActivityMap.Map) return GuardDurationMap.Map;
   function GetHighestMinutesAsleepGuardID(GuardActivityMap : Guard.GuardActivityMap.Map) return Integer;

   procedure PrintActivityMap(Map: in GuardActivityMap.Map);
   procedure PrintMinutesAsleep(GuardActivityMap : Guard.GuardActivityMap.Map);

end Guard;
