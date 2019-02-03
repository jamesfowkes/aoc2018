with Types;

package body Types is

   function Maximum(arr: in IntegerArray) return Integer is
      FoundMaximum : Integer := Integer'First;
   begin
      for I in arr'Range loop
         if arr(I) > FoundMaximum then
            FoundMaximum := arr(I);
         end if;
      end loop;
      
      return FoundMaximum;
   end;

   function MaximumIndex(arr: in IntegerArray) return Integer is
      FoundMaximum : Integer := Integer'First;
      FoundIndex : Integer;
   begin
      for I in arr'Range loop
         if arr(I) > FoundMaximum then
            FoundMaximum := arr(I);
            FoundIndex := I;
         end if;
      end loop;
      
      return FoundIndex;
   end;

end Types;
