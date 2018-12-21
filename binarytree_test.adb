with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with binarytree;

use Ada.Text_IO;
use Ada.Text_IO.Unbounded_IO;
use Ada.Strings.Unbounded;

procedure binarytree_test is
    package intio is new Ada.Text_IO.Integer_IO(Integer);

    input: Integer;
    main: binarytree.binarytree_node;

    procedure get(x: in out Integer) is
        buf: Unbounded_String;
    begin
        buf := Get_Line;
        x := Integer'Value(To_String(buf));
    end;

begin
    binarytree.init;
    loop
        Put_Line(" ");
        Put_Line("1: Insert");
        Put_Line("2: Find");
        Put_Line("3: Traverse");
        Put_Line("4: Test");
        Put_Line("5: Exit");
        Put_Line(" ");

        intio.Get(input);
        case input is
            when 1 =>
                intio.get(input);
                binarytree.insert(input);
                intio.put(input);
                Put_Line(" inserted ");
            when 2 =>
                intio.get(input);
                binarytree.find(input, main);
                if binarytree.value(main) = input then
                    Put("Found ");
                    intio.put(input);
                else
                    intio.put(input);
                    Put_Line(" not found");
                end if;
            when 3 =>
                binarytree.traverse_inorder(main);
            when 4 =>
                for i in Integer range -10 .. 10 loop
                    intio.put(input);
                    if binarytree.has(i) then
                        Put_Line(" found");
                    else
                        Put_Line(" not found");
                    end if;
                end loop;
            when 5 =>
                exit;
            when others =>
                null;
        end case;
    end loop;
end binarytree_test;
