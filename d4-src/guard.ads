with Ada.Containers;
with Ada.Containers.Indefinite_Hashed_Maps;

with Types;
with Activity;

package Guard is

   package GuardActivityMap is new Ada.Containers.Indefinite_Hashed_Maps (
      Key_Type => Integer,
      Element_Type => Activity.ActivityVector.Vector,
      Hash => Types.IntegerHash,
      Equivalent_Keys => "=",
      "=" => Activity.ActivityVector."="
   );

   package GuardDurationMap renames Types.IntegerMap;

   function ParseGuardActivities (
      all_activities : in Activity.ActivityVector.Vector)
      return GuardActivityMap.Map;

   function GetHighestMinutesAsleepGuardID (
      guard_activity_map : Guard.GuardActivityMap.Map) return Integer;

   procedure PrintActivityMap (
      guard_activity_map : in GuardActivityMap.Map);

   procedure PrintMinutesAsleep (
      guard_activity_map : Guard.GuardActivityMap.Map);

end Guard;
