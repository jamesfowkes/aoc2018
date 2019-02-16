with Ada.Strings.Unbounded;
with Ada.Containers;
with Ada.Containers.Indefinite_Hashed_Maps;

package Types is

   type ArrayLocationTuple is
   record
      loc : Integer;
      val : Integer;
   end record;

   function IntegerHash (i : Integer) return Ada.Containers.Hash_Type;

   package IntegerMap is new Ada.Containers.Indefinite_Hashed_Maps (
      Key_Type => Integer,
      Element_Type => Integer,
      Hash => IntegerHash,
      Equivalent_Keys => "="
   );

   type StringArray is array (Natural range <>) of
      Ada.Strings.Unbounded.Unbounded_String;
   type IntegerArray is array (Natural range <>) of Integer;

   function Maximum (arr : in IntegerArray) return ArrayLocationTuple;
   function MaximumIndex (arr : in IntegerArray) return Integer;

end Types;
