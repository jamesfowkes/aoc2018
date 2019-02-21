with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package body d2util is

   function diff_strings_one_character (
      str1 : in Ada.Strings.Unbounded.Unbounded_String;
      str2 : in Ada.Strings.Unbounded.Unbounded_String) return Natural is

      found_diff_index : Natural := 0;
      chr1 : Character;
      chr2 : Character;
   begin
      if Length (str1) /= Length (str2) then
         return 0;
      end if;
      for I in 1 .. Length (str1) loop
         chr1 := Element (str1, I);
         chr2 := Element (str2, I);
         if chr1 /= chr2 then
            if found_diff_index = 0 then
               found_diff_index := I;
            else
               found_diff_index := 0; -- More than one diff found, so not a valid string
               exit;
            end if;
         end if;
      end loop;
      return found_diff_index;
   end diff_strings_one_character;

   function diff_str_with_array (
      str : in Ada.Strings.Unbounded.Unbounded_String; arr : in Types.StringArray) return StringPair is

      result  : StringPair := (
         valid => False,
         A => Ada.Strings.Unbounded.Null_Unbounded_String,
         B => Ada.Strings.Unbounded.Null_Unbounded_String
      );
      diff_result : Natural := 0;
   begin
      for I in arr'Range loop
         diff_result := diff_strings_one_character (str, arr (I));
         if diff_result > 0 then
            result := (valid => True, A => Ada.Strings.Unbounded.Unbounded_Slice (str, 1, diff_result), B => arr (I));
            exit;
         end if;
      end loop;
      return result;
   end diff_str_with_array;

   function count_chars_in_alphastring (str : in Ada.Strings.Unbounded.Unbounded_String) return alphabetcount is
      chr : Character;
      counts : alphabetcount := (others => 0);
      index : Integer;
   begin
      for J in 1 .. Ada.Strings.Unbounded.Length (str) loop
         chr := Ada.Strings.Unbounded.Element (str, J);
         index := Character'Pos (chr) - 97;
         counts (index) := counts (index) + 1;
      end loop;
      return counts;
   end count_chars_in_alphastring;

   function has_char_count (str : in Ada.Strings.Unbounded.Unbounded_String; count : in Integer) return Boolean is
      counts : alphabetcount;
   begin
      counts := count_chars_in_alphastring (str);
      for J in counts'Range loop
         if counts (J) = count then
            return True;
         end if;
      end loop;
      return False;
   end has_char_count;
end d2util;
