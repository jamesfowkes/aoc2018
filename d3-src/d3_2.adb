with Claim;
with Types;
with get_stdin;

procedure d3_2 is
   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   claims : Claim.ClaimVector.Vector;
   overlap : Boolean := False;
begin
   for I in stdin_arr'Range loop
      claims.Append (Claim.FromString (stdin_arr (I)));
   end loop;

   Outer_Loop :
   for I in claims.First_Index .. claims.Last_Index loop
      overlap := False;
      Inner_Loop :
      for J in claims.First_Index .. claims.Last_Index loop
         if I /= J then
            if Claim.claimsoverlap (claims (I), claims (J)) then
               overlap := True;
               exit Inner_Loop;
            end if;
         end if;
      end loop Inner_Loop;

      if not overlap then
         Claim.Print (claims (I));
         exit Outer_Loop;
      end if;
   end loop Outer_Loop;
end d3_2;
