with Ada.Strings.Unbounded;

package get_stdin is
    type StringArray is array (Natural range <>) of Ada.Strings.Unbounded.Unbounded_String;
    type IntegerArray is array (Natural range <>) of Integer;
    
    function get_strs return StringArray;
    function get_ints return IntegerArray;

end get_stdin;
