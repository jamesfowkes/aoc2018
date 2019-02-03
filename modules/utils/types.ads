with Ada.Strings.Unbounded;

package Types is

    type StringArray is array (Natural range <>) of Ada.Strings.Unbounded.Unbounded_String;
    type IntegerArray is array (Natural range <>) of Integer;

end Types;
