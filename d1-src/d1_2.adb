with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers.Hashed_Sets;

with get_stdin;
with Types;

procedure d1_2 is

   package FrequencySet is new Ada.Containers.Hashed_Sets
      (Element_Type => Integer,
      Hash => Types.IntegerHash,
      Equivalent_Elements => "=");

   stdin_arr : constant Types.IntegerArray := get_stdin.get_ints;
   frequency : Integer := 0;
   frequencies : FrequencySet.Set;
begin
   Outer_Loop :
   loop
      for I in stdin_arr'Range loop
         frequency := frequency + stdin_arr (I);

         if FrequencySet.Contains (frequencies, frequency) then
            exit Outer_Loop;
         else
            FrequencySet.Insert (frequencies, frequency);
         end if;

      end loop;
   end loop Outer_Loop;

   Ada.Integer_Text_IO.Put (frequency, Width => 0); Ada.Text_IO.Put_Line ("");
end d1_2;
