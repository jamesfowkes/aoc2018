with Ada.Strings.Unbounded;

with Types;

package d2util is

   type StringPair is
   record
      valid : Boolean;
      A : Ada.Strings.Unbounded.Unbounded_String;
      B : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   type alphabetcount is array (Natural range 0 .. 25) of Natural;

   function count_chars_in_alphastring (str : in Ada.Strings.Unbounded.Unbounded_String) return alphabetcount;
   function has_char_count (str : in Ada.Strings.Unbounded.Unbounded_String; count : in Integer) return Boolean;

   function diff_strings_one_character (
      str1 : in Ada.Strings.Unbounded.Unbounded_String;
      str2 : in Ada.Strings.Unbounded.Unbounded_String) return Natural;

   function diff_str_with_array (
      str : in Ada.Strings.Unbounded.Unbounded_String; arr : in Types.StringArray) return StringPair;

end d2util;
