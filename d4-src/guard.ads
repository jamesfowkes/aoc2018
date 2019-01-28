with Ada.Containers;
with Ada.Containers.Indefinite_Hashed_Maps;
with Activity;

package Guard is
   
   function IntegerHash(i: Integer) return Ada.Containers.Hash_Type;

   package GuardActivity is new Ada.Containers.Indefinite_Hashed_Maps(
      Key_Type => Integer,
      Element_Type => Activity.ActivityVector.Vector,
      Hash => IntegerHash,
      Equivalent_Keys => "="
   );

end Guard;