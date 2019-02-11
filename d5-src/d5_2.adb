with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Streams;
with Ada.Text_IO.Text_Streams;

with Polymer;

procedure d5_2 is

   Input_File : Ada.Text_IO.File_Type:= Ada.Text_IO.Standard_Input;
   Input_Stream : Access Ada.Streams.Root_Stream_Type'Class := 
      Ada.Text_IO.Text_Streams.Stream( File => Input_File );
   C: Character;
   InputPolymerList: Polymer.CharList.List;
   PolymerList: Polymer.CharList.List;
   Lengths : Types.IntegerArray(A..Z) := (others => 0);

begin

   Ada.Text_IO.Put_Line("Day 5");

   while not Ada.Text_IO.End_Of_File loop
      Character'Read(Input_Stream, C );
      InputPolymerList.Append(C);
   end loop;
   
   for C in Character range A .. Z loop

      PolymerList := InputPolymerList;
      Polymer.Remove(PolymerList, C);

      while True loop
         if Polymer.React(PolymerList) = False then
            exit;
         end if;
      end loop;

      Lengths(C) := Polymer.Length(PolymerList);
   end loop;

   Ada.Integer_Text_IO.Put(Ada.Strings.Unbounded.Length(Polymer.To_String(PolymerList)));
   Ada.Text_IO.Put_Line(" characters");
   Polymer.Print(PolymerList);

end d5_2;
