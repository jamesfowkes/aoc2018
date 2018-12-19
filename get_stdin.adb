with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Strings;

package body get_stdin is
    function get_strs return StringArray is
        Counter : Natural := 0;
        Str  : Ada.Strings.Unbounded.Unbounded_String;
        Arr  : StringArray(0..10000);
    begin
        while not Ada.Text_IO.End_Of_File loop
            Str := Ada.Text_IO.Unbounded_IO.Get_Line;
            Arr(Counter) := Str;
            Counter := Counter + 1;
        end loop;
        
        return Arr(0..Counter-1);
    end get_strs;

    function get_ints return IntegerArray is
        Counter : Natural := 0;
        Str  : Ada.Strings.Unbounded.Unbounded_String;
        Arr  : IntegerArray(0..10000);
    begin
        while not Ada.Text_IO.End_Of_File loop
            Str := Ada.Text_IO.Unbounded_IO.Get_Line;
            Arr(Counter) := Integer'Value(Ada.Strings.Unbounded.To_String(Str));
            Counter := Counter + 1;
        end loop;
        
        return Arr(0..Counter-1);
    end get_ints;

end get_stdin;
