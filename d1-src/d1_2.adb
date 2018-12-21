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
    MinFreq: Integer := 1;
    MaxFreq: Integer := 0;
    RequiredLength: Integer := 1;
    Frequencies: utils.BooleanVector.Vector;
begin
    Outer_Loop:
    loop
        for I in StdinArr'Range loop
            Frequency := Frequency + StdinArr(I);

            if Frequency < MinFreq then
                MinFreq := Frequency;
            end if;

            if Frequency > MaxFreq then
                MaxFreq := Frequency;
            end if;

            RequiredLength := (MaxFreq - MinFreq) + 1;
            utils.BooleanVector.Set_Length(Frequencies, Ada.Containers.Count_Type(RequiredLength));

            Ada.Integer_Text_IO.Put(MinFreq, Width => 0); Ada.Text_IO.Put_Line("");
            Ada.Integer_Text_IO.Put(MaxFreq, Width => 0); Ada.Text_IO.Put_Line("");
            Ada.Integer_Text_IO.Put(Frequency, Width => 0); Ada.Text_IO.Put_Line("");
            Ada.Integer_Text_IO.Put(RequiredLength, Width => 0); Ada.Text_IO.Put_Line("");
            Ada.Integer_Text_IO.Put(Integer(utils.BooleanVector.Length(Frequencies)), Width => 0); Ada.Text_IO.Put_Line("");
            Ada.Integer_Text_IO.Put(Integer(utils.BooleanVector.First_Index(Frequencies)), Width => 0); Ada.Text_IO.Put_Line("");
            Ada.Integer_Text_IO.Put(Integer(utils.BooleanVector.Last_Index(Frequencies)), Width => 0); Ada.Text_IO.Put_Line("");
            
            if utils.BooleanVector.Element(Frequencies, Frequency) then
                exit Outer_Loop;
            end if;
            Frequencies(Frequency) := True;
        end loop;
    end loop Outer_Loop;

    Ada.Integer_Text_IO.Put(Frequency, Width => 0); Ada.Text_IO.Put_Line("");
end;
