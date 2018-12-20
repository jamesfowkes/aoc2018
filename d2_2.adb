with get_stdin;
with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure d2_2 is

    type StringPair is
    record
       valid : Boolean;
       A : Unbounded_String;
       B : Unbounded_String;
    end record;

    function diff_strings(str1: in Unbounded_String; str2: in Unbounded_String) return Boolean is
        found_diff : Boolean := false;
        chr1: Character;
        chr2: Character;
    begin
        if Length(str1) /= Length(str2) then
            return False;
        end if;
        for I in 1 .. Length(str1) loop
            chr1 := Element(str1, I);
            chr2 := Element(str2, I);
            if found_diff then
                if chr1 /= chr2 then
                    return False;
                end if;
            else
                found_diff := chr1 /= chr2;
            end if;
        end loop;
        return found_diff;
    end diff_strings;

    function diff_str_with_array(str: in Unbounded_String; arr: in get_stdin.StringArray) return StringPair is
        result : StringPair := (
            valid => false,
            A => Ada.Strings.Unbounded.Null_Unbounded_String,
            B => Ada.Strings.Unbounded.Null_Unbounded_String
        );
    begin
        for I in arr'Range loop
            if diff_strings(str, arr(I)) then
                result := (valid => true, A => str, B => arr(I));
                exit;
            end if;
        end loop;
        return result;
    end diff_str_with_array;

    stdin_arr : get_stdin.StringArray := get_stdin.get_strs;
    result : StringPair := (
        valid => false,
        A => Ada.Strings.Unbounded.Null_Unbounded_String,
        B => Ada.Strings.Unbounded.Null_Unbounded_String
    );

begin
    for I in stdin_arr'Range loop

        result := diff_str_with_array(stdin_arr(i), stdin_arr(I..stdin_arr'Last));

        if result.valid = True then
            exit;
        end if;
    end loop;

    Ada.Text_IO.Unbounded_IO.Put_Line(result.A);
    Ada.Text_IO.Unbounded_IO.Put_Line(result.B);
end;
