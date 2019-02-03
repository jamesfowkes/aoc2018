with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Hash;
with Ada.Containers.Hashed_Maps;

with get_stdin;
with Types;
with Claim;
with Coord;

procedure d3 is

   package UStr renames Ada.Strings.Unbounded;

   package FabricMap is new Ada.Containers.Hashed_Maps
     (Key_Type => Coord.Coordinate,
      Element_Type => Integer,
      Hash => Coord.Hash,
      Equivalent_Keys => Coord."=");

   StdinArr : Types.StringArray := get_stdin.get_strs;
   Claims : Claim.ClaimVector.Vector;
   Fabric : FabricMap.Map;
   Count : Integer := 0;
   ThisCoord : Coord.Coordinate := (x => 0, y => 0);
begin
   for I in StdinArr'Range loop
      Claims.Append(Claim.From_String(StdinArr(I)));
   end loop;

   for I in Claims.First_Index .. Claims.Last_Index loop
      for x in Claims(I).cstart.x .. Claims(I).cend.x loop
         for y in Claims(I).cstart.y .. Claims(I).cend.y loop
            ThisCoord.x := x;
            ThisCoord.y := y;
            if Fabric.Contains(ThisCoord) then
               if Fabric(ThisCoord) = 0 then
                  Count := Count + 1;
               end if;
               Fabric(ThisCoord) := Fabric(ThisCoord) + 1;
            else
               Fabric.Insert(ThisCoord, 0);
            end if;
         end loop;
      end loop;
   end loop;

   Ada.Text_IO.Put_Line(Integer'Image(Count));
end;
