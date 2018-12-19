with Ada.Containers.Vectors;
with Ada.Containers.Vectors;
package body utils is
    function int_in_vector(needle: Integer; haystack: IntegerVector.Vector) return Boolean is
        C : IntegerVector.Cursor;
    begin
        C := IntegerVector.First(haystack);
        while IntegerVector.Has_Element(C) loop
            if IntegerVector.Element(C) = needle then
                return True;
            end if;
            IntegerVector.Next (C);
        end loop;
        return False;
    end int_in_vector;

end utils;