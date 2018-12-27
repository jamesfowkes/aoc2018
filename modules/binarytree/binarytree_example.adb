with Ada.Text_IO;
with binarytree;

use binarytree;

use Ada.Text_IO;

procedure binarytree_example is
   package intio is new Ada.Text_IO.Integer_IO (Integer);

   input : Integer;
   integer_tree : binarytree.binarytree_root;

begin

   binarytree.init (integer_tree);

   loop
      Put_Line (" ");
      Put_Line ("1: Insert");
      Put_Line ("2: Find");
      Put_Line ("3: Traverse");
      Put_Line ("4: Test");
      Put_Line ("5: Exit");
      Put_Line (" ");

      intio.Get (input);
      case input is
         when 1 =>
            intio.Get (input);
            binarytree.insert (integer_tree, input);
            intio.Put (input, Width => 0);
            Put_Line (" inserted");
         when 2 =>
            intio.Get (input);
            if binarytree.has (integer_tree, input) then
               Put ("Tree has ");
               intio.Put (input, Width => 0);
            else
               Put ("Tree does not have ");
               intio.Put (input, Width => 0);
            end if;
               Put_Line ("");
         when 3 =>
            binarytree.traverse_inorder (integer_tree);
         when 4 =>
            for i in Integer range -10 .. 10 loop
               intio.Put (i);
               if binarytree.has (integer_tree, i) then
                  Put_Line (" found");
               else
                  Put_Line (" not found");
               end if;
            end loop;
         when 5 =>
            exit;
         when others =>
            null;
      end case;
   end loop;
end binarytree_example;
