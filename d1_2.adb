with get_stdin;
with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Maps;

procedure d1_2 is

  StdinArr : get_stdin.IntegerArray := get_stdin.get_ints;
  Frequency: Integer := 0;
  Count: Natural := 0;
  FrequencyList: array (Natural range <>) of Integer;
begin
  for I in StdinArr'Range loop
    FCCursor := FrequencyCounter.Find(Frequency);
    if FCCursor = FrequencyMap.No_Element then
      FrequencyCounter.Insert (Frequency, 1);
    else
      Count := FrequencyMap.Element(FCCursor);
      if Count = 1
      FrequencyCounter.Replace_Element(
        Position => FCCursor,
        New_Item => Count + 1);
    end if;
    Frequency := Frequency + StdinArr(I);
  end loop;
end;
