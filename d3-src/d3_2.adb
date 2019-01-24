with get_stdin;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Hash;
with Ada.Containers.Hashed_Maps;
with Claim;

procedure d3_2 is

   package UStr renames Ada.Strings.Unbounded;

   -- StdinArr : get_stdin.StringArray := get_stdin.get_strs;
   -- Claims : Claim.ClaimVector.Vector;
   -- Overlap : Boolean := False;

   base: Claim.ClaimRecord := (num => 0, cstart => (x => 100, y => 100), cend => (x => 110, y => 110));
   test_same_size: Claim.ClaimRecord := (num => 0, cstart => (x => 0, y => 0), cend => (x => 0, y => 0));

begin
   --  for I in StdinArr'Range loop
   --     Claims.Append(Claim.From_String(StdinArr(I)));
   --  end loop;
--  
   --  Outer_Loop:
   --  for I in Claims.First_Index .. Claims.Last_Index loop
   --     Overlap := False;
   --     Inner_Loop:
   --     for J in Claims.First_Index .. Claims.Last_Index loop
   --        if I /= J then
   --           if Claim.ClaimsOverlap(Claims(I), Claims(J)) then
   --              Overlap := True;
   --              Ada.Text_IO.Put(Integer'Image(I));
   --              Ada.Text_IO.Put(",");
   --              Ada.Text_IO.Put_Line(Integer'Image(J));
   --              exit Inner_Loop;
   --           end if;
   --        end if;
   --     end loop Inner_Loop;
--  
   --     if not Overlap then
   --        Ada.Text_IO.Put_Line(Integer'Image(I));
   --        Claim.Print(Claims(I));
   --        exit Outer_Loop;
   --     end if;
   --  end loop Outer_Loop;

   test_same_size := Claim.Translate(base, -11, -11);

   for I in 0 .. 22 loop
      for J in 0 .. 22 loop
      
         if Claim.ClaimsOverlap(base, test_same_size) then
            Claim.Print(test_same_size);
            Ada.Text_IO.Put_Line("");
         end if;

      test_same_size := Claim.Translate(test_same_size, 1, 0);
      end loop;
   test_same_size := Claim.Translate(test_same_size, -23, 1);
   end loop;
end;
