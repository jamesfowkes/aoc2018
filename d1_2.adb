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
    loop
        for I in StdinArr'Range loop
            Frequency := Frequency + StdinArr(I);
                if (utils.int_in_vector(Frequency, Frequencies)) then
                    goto Finish;
                end if;
            utils.IntegerVector.Append(Frequencies, Frequency);
        end loop;
    end loop;

    <<Finish>>
    Ada.Integer_Text_IO.Put(Frequency, Width => 0); Ada.Text_IO.Put_Line("");
end;
