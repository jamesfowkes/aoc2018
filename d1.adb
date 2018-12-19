with get_stdin;
with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;

procedure d1 is
    StdinArr : get_stdin.IntegerArray := get_stdin.get_ints;
    Frequency: Integer :=0 ;
begin
    for I in StdinArr'Range loop
        Frequency := Frequency + StdinArr(I);
    end loop;
    Ada.Integer_Text_IO.Put(Frequency, Width => 0); Ada.Text_IO.Put_Line("");
end;
