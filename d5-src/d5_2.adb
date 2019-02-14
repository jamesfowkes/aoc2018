with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Streams;
with Ada.Text_IO.Text_Streams;
with Ada.Characters.Handling;

with Types;
with Polymer;

procedure d5_2 is

   type LowerCaseChars is new Character range 'A' .. 'Z';
   type Arr_Type is array (Integer range <>) of Character;
   A : Arr_Type (1 .. 26) := "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
   
   Input_File : Ada.Text_IO.File_Type:= Ada.Text_IO.Standard_Input;
   Input_Stream : Access Ada.Streams.Root_Stream_Type'Class := 
      Ada.Text_IO.Text_Streams.Stream( File => Input_File );
   C: Character;
   InputPolymerList: Polymer.CharList.List;
   PolymerList: Polymer.CharList.List;
   Lengths : Types.IntegerArray(1 .. 26) := (others => 0);

begin

   Ada.Text_IO.Put_Line("Day 5 - 2");

   while not Ada.Text_IO.End_Of_File loop
      Character'Read(Input_Stream, C );
      InputPolymerList.Append(C);
   end loop;
   
   for I in Integer range 1 .. 26 loop
      C := A(I);
      Ada.Text_IO.Put(C);
      Ada.Text_IO.Put(": ");

      PolymerList := InputPolymerList;
      PolymerList := Polymer.Remove(PolymerList, C);
      PolymerList := Polymer.Remove(PolymerList, Ada.Characters.Handling.To_Lower(C));

      Ada.Integer_Text_IO.Put(Polymer.Length(PolymerList));
      Ada.Text_IO.Put_Line("");   

      while True loop
         if Polymer.React(PolymerList) = False then
            exit;
         end if;
      end loop;

      Lengths(I) := Polymer.Length(PolymerList);
      Ada.Integer_Text_IO.Put(Lengths(I));
      Ada.Text_IO.Put_Line("");   
   end loop;

   Ada.Integer_Text_IO.Put(Ada.Strings.Unbounded.Length(Polymer.To_String(PolymerList)));
   Ada.Text_IO.Put_Line(" characters");
   Polymer.Print(PolymerList);

end d5_2;
