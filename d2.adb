with get_stdin;
with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure d2 is

    type alphabetcount is array(Natural range 0..25) of Natural;

    StdinArr : get_stdin.StringArray := get_stdin.get_strs;
    TwoCount: Integer := 0;
    ThreeCount: Integer := 0;

    function count_chars_in_alphastring(
        str: in Ada.Strings.Unbounded.Unbounded_String
    ) return alphabetcount is
        chr: Character;
        counts: alphabetcount := (others => 0);
        index: Integer;
    begin
        for J in 1 .. Length(str) loop
            chr := Element(str, J);
            index := Character'Pos(chr) - 97;
            counts(index) := counts(index) + 1;
        end loop;
        return counts;
    end count_chars_in_alphastring;

    function has_char_count(str: in Ada.Strings.Unbounded.Unbounded_String; count: in Integer) return Boolean is
        counts: alphabetcount;
    begin
        counts := count_chars_in_alphastring(str);
        for J in counts'Range loop
            if counts(J) = count then
                return True;
            end if;
        end loop;
        return False;
    end has_char_count;

begin
    for I in StdinArr'Range loop
        if has_char_count(StdinArr(I), 2) then
            TwoCount := TwoCount + 1;
        end if;
        if has_char_count(StdinArr(I), 3) then
            ThreeCount := ThreeCount + 1;
        end if;
    end loop;
    Ada.Integer_Text_IO.Put(TwoCount*ThreeCount, Width => 0); Ada.Text_IO.Put_Line("");
end;
