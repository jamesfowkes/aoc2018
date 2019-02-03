with Ada.Strings.Unbounded;

package Types is

    type StringArray is array (Natural range <>) of Ada.Strings.Unbounded.Unbounded_String;
    type IntegerArray is array (Natural range <>) of Integer;

    function Maximum(arr: in IntegerArray) return Integer;
    function MaximumIndex(arr: in IntegerArray) return Integer;
end Types;
