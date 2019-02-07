package body utils is

   function int_in_vector (
      needle : Integer;
      haystack : IntegerVector.Vector) return Boolean is
   begin
      for C in haystack.Iterate loop
         if IntegerVector.Element (C) = needle then
            return True;
         end if;
      end loop;
      return False;
   end int_in_vector;

end utils;
