with Ada.Text_IO;
with Ada.Containers.Hashed_Maps;

with get_stdin;
with Types;
with Claim;
with Coord;

procedure d3 is

   package FabricMap is new Ada.Containers.Hashed_Maps
     (Key_Type => Coord.Coordinate,
      Element_Type => Integer,
      Hash => Coord.Hash,
      Equivalent_Keys => Coord."=");

   stdin_arr : constant Types.StringArray := get_stdin.get_strs;
   claims : Claim.ClaimVector.Vector;
   fabric : FabricMap.Map;
   Count : Integer := 0;
   this_coord : Coord.Coordinate := (x => 0, y => 0);
begin
   for I in stdin_arr'Range loop
      claims.Append (Claim.FromString (stdin_arr (I)));
   end loop;

   for I in claims.First_Index .. claims.Last_Index loop
      for x in claims (I).cstart.x .. claims (I).cend.x loop
         for y in claims (I).cstart.y .. claims (I).cend.y loop
            this_coord.x := x;
            this_coord.y := y;
            if fabric.Contains (this_coord) then
               if fabric (this_coord) = 0 then
                  Count := Count + 1;
               end if;
               fabric (this_coord) := fabric (this_coord) + 1;
            else
               fabric.Insert (this_coord, 0);
            end if;
         end loop;
      end loop;
   end loop;

   Ada.Text_IO.Put_Line (Integer'Image (Count));
end d3;
