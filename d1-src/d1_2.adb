with get_stdin;
with utils;
with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

procedure d1_2 is

    stdin_arr : get_stdin.IntegerArray := get_stdin.get_ints;
    frequency: Integer := 0;
    frequencies: binarytree.binarytree_node;
begin
    Outer_Loop:
    loop
        for I in stdin_arr'Range loop
            frequency := frequency + stdin_arr(I);

            if binarytree.has(frequency, frequencies); then
                exit Outer_Loop;
            else
                binarytree.insert(frequency);
            end if;

        end loop;
    end loop Outer_Loop;

    Ada.Integer_Text_IO.Put(frequency, Width => 0); Ada.Text_IO.Put_Line("");
end;
