with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded;

package Polymer is

   package CharList is new Ada.Containers.Doubly_Linked_Lists (Character);

   function CanReact (C1 : Character; C2 : Character) return Boolean;
   function ToString (ToConvert : in CharList.List) return Ada.Strings.Unbounded.Unbounded_String;
   procedure Print (ToPrint : in CharList.List);
   function React (ToReact : in out CharList.List) return Boolean;
   function Remove (InputPolymer : in out CharList.List; ToRemove : Character) return CharList.List;
   function Length (L : in out CharList.List) return Integer;

end Polymer;
