with Ada.Containers;
with Ada.Containers.Indefinite_Hashed_Maps;
with Activity;

package Guard is
   
   function IntegerHash(i: Integer) return Ada.Containers.Hash_Type;

   package GuardActivityMap is new Ada.Containers.Indefinite_Hashed_Maps(
      Key_Type => Integer,
      Element_Type => Activity.ActivityVector.Vector,
      Hash => IntegerHash,
      Equivalent_Keys => "=",
      "=" => Activity.ActivityVector."="
   );

   package GuardDurationMap is new Ada.Containers.Indefinite_Hashed_Maps(
      Key_Type => Integer,
      Element_Type => Integer,
      Hash => IntegerHash,
      Equivalent_Keys => "="
   );

   function ParseGuardActivities(AllActivities: in Activity.ActivityVector.Vector) return GuardActivityMap.Map;
   function GetSleepDurations(GuardActivities: in GuardActivityMap.Map) return GuardDurationMap.Map;

   procedure PrintActivityMap(Map: in GuardActivityMap.Map);

end Guard;
