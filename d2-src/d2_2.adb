with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with get_stdin;
with Types;

procedure d2_2 is

    type StringPair is
    record
       valid : Boolean;
       A : Unbounded_String;
       B : Unbounded_String;
    end record;

    function diff_strings_one_character(str1: in Unbounded_String; str2: in Unbounded_String) return Natural is
        found_diff_index : Natural := 0;
        chr1: Character;
        chr2: Character;
    begin
        if Length(str1) /= Length(str2) then
            return 0;
        end if;
        for I in 1 .. Length(str1) loop
            chr1 := Element(str1, I);
            chr2 := Element(str2, I);

            if chr1 /= chr2 then
                if found_diff_index = 0 then
                    found_diff_index := I;
                else
                    found_diff_index := 0; -- More than one diff found, so not a valid string
                    exit;
                end if;
            end if;
        end loop;

        return found_diff_index;
    end diff_strings_one_character;

    function diff_str_with_array(str: in Unbounded_String; arr: in Types.StringArray) return StringPair is
        result : StringPair := (
            valid => false,
            A => Ada.Strings.Unbounded.Null_Unbounded_String,
            B => Ada.Strings.Unbounded.Null_Unbounded_String
        );
        diff_result: Natural := 0;
    begin
        for I in arr'Range loop
            diff_result := diff_strings_one_character(str, arr(I)); 
            if diff_result > 0 then
                result := (valid => true, A => Ada.Strings.Unbounded.Unbounded_Slice(str, 1, diff_result), B => arr(I));
                exit;
            end if;
        end loop;
        return result;
    end diff_str_with_array;

    stdin_arr : Types.StringArray := get_stdin.get_strs;
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
