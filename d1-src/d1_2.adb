with get_stdin;
with utils;
with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

procedure d1_2 is

    StdinArr : get_stdin.IntegerArray := get_stdin.get_ints;
    Frequency: Integer := 0;
    Frequencies: utils.IntegerVector.Vector;

begin
    Outer_Loop:
    loop
        for I in StdinArr'Range loop
            Frequency := Frequency + StdinArr(I);
            if (utils.int_in_vector(Frequency, Frequencies)) then
                exit Outer_Loop;
            end if;
            utils.IntegerVector.Append(Frequencies, Frequency);
        end loop;
    end loop Outer_Loop;

    Ada.Integer_Text_IO.Put(Frequency, Width => 0); Ada.Text_IO.Put_Line("");
end;
