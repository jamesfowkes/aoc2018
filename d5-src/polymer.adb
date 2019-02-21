with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Characters.Handling;

package body Polymer is

   function CanReact (C1 : Character; C2 : Character) return Boolean is
   begin
      return (
         (Ada.Characters.Handling.Is_Upper (C1) xor
            Ada.Characters.Handling.Is_Upper (C2))
         and
         (Ada.Characters.Handling.To_Lower (C1) =
            Ada.Characters.Handling.To_Lower (C2))
      );
   end CanReact;

   function ToString (ToConvert : in CharList.List) return Ada.Strings.Unbounded.Unbounded_String is
      cur : CharList.Cursor := CharList.First (ToConvert);
      S : Ada.Strings.Unbounded.Unbounded_String;
   begin
      while CharList.Has_Element (cur) loop
         Ada.Strings.Unbounded.Append (S, CharList.Element (cur));
         CharList.Next (cur);
      end loop;
      return S;
   end ToString;

   procedure Print (ToPrint : in CharList.List) is
   begin
      Ada.Text_IO.Unbounded_IO.Put_Line (ToString (ToPrint));
   end Print;

   function React (ToReact : in out CharList.List) return Boolean is
      cur1 : CharList.Cursor := CharList.First (ToReact);
      cur2 : CharList.Cursor := CharList.Next (CharList.First (ToReact));
      C1 : Character;
      C2 : Character;
   begin
      while CharList.Has_Element (cur2) loop
         C1 := CharList.Element (cur1);
         C2 := CharList.Element (cur2);

         if CanReact (C1, C2) then
            CharList.Delete (ToReact, cur1);
            CharList.Delete (ToReact, cur2);

            return True;
         end if;

         CharList.Next (cur1);
         CharList.Next (cur2);
      end loop;

      return False;
   end React;

   function Remove (InputPolymer : in out CharList.List; ToRemove : Character) return CharList.List is
      Cur : CharList.Cursor := CharList.First (InputPolymer);
      to_delete : CharList.Cursor;
      C : Character;
   begin
      while CharList.Has_Element (Cur) loop
         C := CharList.Element (Cur);
         if C = ToRemove then
            to_delete := Cur;
            CharList.Next (Cur);
            CharList.Delete (InputPolymer, to_delete);
         else
            CharList.Next (Cur);
         end if;
      end loop;
      return InputPolymer;
   end Remove;

   function Length (L : in out CharList.List) return Integer is
   begin
      return Integer (CharList.Length (L));
   end Length;

end Polymer;
