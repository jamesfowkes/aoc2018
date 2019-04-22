with Ada.Containers.Vectors;

package utils is

   package CharacterVector is new Ada.Containers.Vectors
   (
      Element_Type => Character,
      Index_Type => Natural
   );

   package IntegerVector is new Ada.Containers.Vectors
   (
      Element_Type => Integer,
      Index_Type => Natural
   );

   package BooleanVector is new Ada.Containers.Vectors
   (
      Element_Type => Boolean,
      Index_Type => Natural
   );

   function int_in_vector (needle : Integer;
      haystack : IntegerVector.Vector) return Boolean;

   function char_in_vector (needle : Character;
      haystack : CharacterVector.Vector) return Boolean;

end utils;
