with Ada.Text_IO;
with Ada.Strings;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;

with Types;

package body get_stdin is
    function get_strs return Types.StringArray is
        counter : Natural := 0;
        arr  : Types.StringArray(0..10000);
    begin
        while not Ada.Text_IO.End_Of_File loop
            arr(counter) := Ada.Text_IO.Unbounded_IO.Get_Line;
            counter := counter + 1;
        end loop;
        
        return arr(0..counter-1);
    end get_strs;

    function get_ints return Types.IntegerArray is
        counter : Natural := 0;
        str  : String(1..80);
        last : Natural;
        arr  : Types.IntegerArray(0..10000);
    begin
        while not Ada.Text_IO.End_Of_File loop
            Ada.Text_IO.Get_Line(str, last);
            arr(counter) := Integer'Value(str(1..last));
            counter := counter + 1;
        end loop;
        
        return arr(0..counter-1);
    end get_ints;

end get_stdin;
