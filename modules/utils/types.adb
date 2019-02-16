package body Types is

   function IntegerHash (i : Integer) return Ada.Containers.Hash_Type is
   begin
      return Ada.Containers.Hash_Type (i);
   end IntegerHash;

   function Maximum (arr : in IntegerArray) return ArrayLocationTuple is
      FoundMaximum : ArrayLocationTuple;
   begin
      FoundMaximum.val := arr (arr'First);
      FoundMaximum.loc := arr'First;

      for I in arr'Range loop
         if arr (I) > FoundMaximum.val then
            FoundMaximum.loc := I;
            FoundMaximum.val := arr (I);
         end if;
      end loop;

      return FoundMaximum;
   end Maximum;

   function MaximumIndex (arr : in IntegerArray) return Integer is
      FoundMaximum : Integer := Integer'First;
      FoundIndex : Integer;
   begin
      for I in arr'Range loop
         if arr (I) > FoundMaximum then
            FoundMaximum := arr (I);
            FoundIndex := I;
         end if;
      end loop;

      return FoundIndex;
   end MaximumIndex;

end Types;
