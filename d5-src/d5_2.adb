with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Streams;
with Ada.Text_IO.Text_Streams;
with Ada.Characters.Handling;

with Types;
with Polymer;

procedure d5_2 is

   type Arr_Type is array (Integer range <>) of Character;
   A : constant Arr_Type (1 .. 26) := "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

   input_file : constant Ada.Text_IO.File_Type := Ada.Text_IO.Standard_Input;
   input_stream : constant access Ada.Streams.Root_Stream_Type'Class :=
      Ada.Text_IO.Text_Streams.Stream (File => input_file);
   C : Character;
   input_polymer_list : Polymer.CharList.List;
   polymer_list : Polymer.CharList.List;
   lengths : Types.IntegerArray (1 .. 26) := (others => 0);

begin

   Ada.Text_IO.Put_Line ("Day 5 - 2");

   while not Ada.Text_IO.End_Of_File loop
      Character'Read (input_stream, C);
      input_polymer_list.Append (C);
   end loop;

   for I in Integer range 1 .. 26 loop
      C := A (I);
      Ada.Text_IO.Put (C);
      Ada.Text_IO.Put (": ");

      polymer_list := input_polymer_list;
      polymer_list := Polymer.Remove (polymer_list, C);
      polymer_list := Polymer.Remove (polymer_list, Ada.Characters.Handling.To_Lower (C));

      Ada.Integer_Text_IO.Put (Polymer.Length (polymer_list));
      Ada.Text_IO.Put_Line ("");

      while True loop
         if Polymer.React (polymer_list) = False then
            exit;
         end if;
      end loop;

      lengths (I) := Polymer.Length (polymer_list);
      Ada.Integer_Text_IO.Put (lengths (I));
      Ada.Text_IO.Put_Line ("");
   end loop;

   Ada.Integer_Text_IO.Put (Ada.Strings.Unbounded.Length (Polymer.ToString (polymer_list)));
   Ada.Text_IO.Put_Line (" characters");
   Polymer.Print (polymer_list);

end d5_2;
