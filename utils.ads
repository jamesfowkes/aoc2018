with Ada.Containers.Vectors;

package utils is

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

    function int_in_vector(needle: Integer; haystack: IntegerVector.Vector) return Boolean;
end utils;
