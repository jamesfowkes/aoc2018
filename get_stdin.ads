package get_stdin is
    type StringArray is array (Natural range <>) of String(1..80);
    type IntegerArray is array (Natural range <>) of Integer;
    
    function get_strs return StringArray;
    function get_ints return IntegerArray;

end get_stdin;
