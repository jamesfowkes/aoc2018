with get_stdin;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Hash;
with Ada.Containers.Hashed_Maps;
with Claim;

procedure d3_2 is

   package UStr renames Ada.Strings.Unbounded;

   StdinArr : get_stdin.StringArray := get_stdin.get_strs;
   Claims : Claim.ClaimVector.Vector;
   Overlap : Boolean := False;
begin
   for I in StdinArr'Range loop
      Claims.Append(Claim.From_String(StdinArr(I)));
   end loop;

   Outer_Loop:
   for I in Claims.First_Index .. Claims.Last_Index loop
      Overlap := False;
      Inner_Loop:
      for J in Claims.First_Index .. Claims.Last_Index loop
         if I /= J then
            if Claim.ClaimsOverlap(Claims(I), Claims(J)) then
               Overlap := True;
               exit Inner_Loop;
            end if;
         end if;
      end loop Inner_Loop;

      if not Overlap then
         Claim.Print(Claims(I));
         exit Outer_Loop;
      end if;
   end loop Outer_Loop;
end;
