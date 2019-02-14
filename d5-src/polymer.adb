with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;

package body Polymer is

   function Can_React(C1: Character; C2: Character) return Boolean is
   begin
      return (
         (Ada.Characters.Handling.Is_Upper(C1) xor Ada.Characters.Handling.Is_Upper(C2))
         and 
         (Ada.Characters.Handling.To_Lower(C1) = Ada.Characters.Handling.To_Lower(C2))
      );
   end;

   function To_String(ToConvert: in CharList.List) return Ada.Strings.Unbounded.Unbounded_String is
      Cur: CharList.Cursor := CharList.First(ToConvert);
      S: Ada.Strings.Unbounded.Unbounded_String;
   begin
      while CharList.Has_Element(Cur) loop
         Ada.Strings.Unbounded.Append(S, CharList.Element(Cur));
         CharList.Next(Cur);
      end loop;
      return S;
   end To_String;

   procedure Print(ToPrint: in CharList.List) is
   begin
      Ada.Text_IO.Unbounded_IO.Put_Line(To_String(ToPrint));
   end Print;

   function React(ToReact: in out CharList.List) return Boolean is
      Length: Ada.Containers.Count_Type := CharList.Length(ToReact);
      Cur1: CharList.Cursor := CharList.First(ToReact);
      Cur2: CharList.Cursor := CharList.Next(CharList.First(ToReact));
      C1: Character;
      C2: Character;
   begin 
      while CharList.Has_Element(Cur2) loop
         C1 := CharList.Element(Cur1);
         C2 := CharList.Element(Cur2);

         if Can_React(C1, C2) then
            CharList.Delete(ToReact, Cur1);
            CharList.Delete(ToReact, Cur2);
         
            return True;
         end if;

         CharList.Next(Cur1);
         CharList.Next(Cur2);
      end loop;
   
      return False;
   end React;

   function Remove(InputPolymer: in out CharList.List; ToRemove: Character) return CharList.List is
      Cur: CharList.Cursor := CharList.First(InputPolymer);
      ToDelete: CharList.Cursor;
      C: Character;
   begin
      while CharList.Has_Element(Cur) loop
         C := CharList.Element(Cur);
         if C = ToRemove then
            ToDelete := Cur;
            CharList.Next(Cur);
            CharList.Delete(InputPolymer, ToDelete);
         else
            CharList.Next(Cur);
         end if;
      end loop;
      return InputPolymer;
   end Remove;

   function Length(L: in out CharList.List) return Integer is
   begin
      return Integer(CharList.Length(L));
   end Length;

end Polymer;
