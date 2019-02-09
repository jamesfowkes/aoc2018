with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Streams;
with Ada.Text_IO.Text_Streams;
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Characters.Handling;

procedure d5 is

   package CharList is new Ada.Containers.Doubly_Linked_Lists(Character);

   function Can_React(C1: Character; C2: Character) return Boolean is
   begin
      return (
         (Ada.Characters.Handling.Is_Upper(C1) xor Ada.Characters.Handling.Is_Upper(C2))
         and 
         (Ada.Characters.Handling.To_Lower(C1) = Ada.Characters.Handling.To_Lower(C2))
      );
   end;

   function To_String(Polymer: in CharList.List) return Ada.Strings.Unbounded.Unbounded_String is
      Cur: CharList.Cursor := CharList.First(Polymer);
      S: Ada.Strings.Unbounded.Unbounded_String;
   begin
      while CharList.Has_Element(Cur) loop
         Ada.Strings.Unbounded.Append(S, CharList.Element(Cur));
         CharList.Next(Cur);
      end loop;
      return S;
   end To_String;

   procedure Print(Polymer: in CharList.List) is
   begin
      Ada.Text_IO.Unbounded_IO.Put_Line(To_String(Polymer));
   end Print;

   function React(Polymer: in out CharList.List) return Boolean is
      Length: Ada.Containers.Count_Type := CharList.Length(Polymer);
      Cur1: CharList.Cursor := CharList.First(Polymer);
      Cur2: CharList.Cursor := CharList.Next(CharList.First(Polymer));
      C1: Character;
      C2: Character;
   begin 
      while CharList.Has_Element(Cur2) loop   
         C1 := CharList.Element(Cur1);
         C2 := CharList.Element(Cur2);

         if Can_React(C1, C2) then
            CharList.Delete(Polymer, Cur1);
            CharList.Delete(Polymer, Cur2);
         
            return True;
         end if;

         CharList.Next(Cur1);
         CharList.Next(Cur2);
      end loop;
   
      return False;
   end React;

   Input_File : Ada.Text_IO.File_Type:= Ada.Text_IO.Standard_Input;
   Input_Stream : Access Ada.Streams.Root_Stream_Type'Class := 
      Ada.Text_IO.Text_Streams.Stream( File => Input_File );
   C: Character;
   Polymer: CharList.List;
begin

   Ada.Text_IO.Put_Line("Day 5");

   while not Ada.Text_IO.End_Of_File loop
      Character'Read(Input_Stream, C );
      Polymer.Append(C);
   end loop;
   
   while True loop
      if React(Polymer) = False then
         exit;
      end if;   
   end loop;


   Ada.Integer_Text_IO.Put(Ada.Strings.Unbounded.Length(To_String(Polymer)));
   Ada.Text_IO.Put_Line(" characters");
   Print(Polymer);
end d5;
