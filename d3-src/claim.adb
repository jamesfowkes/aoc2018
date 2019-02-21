with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Claim is

   function ClaimsOverlap (
      c1 : in ClaimRecord; c2 : in ClaimRecord) return Boolean is
   begin
      return (
         (c1.cstart.x <= c2.cend.x) and
         (c1.cend.x >= c2.cstart.x) and
         (c1.cstart.y <= c2.cend.y) and
         (c1.cend.y >= c2.cstart.y)
      );
   end ClaimsOverlap;

   function From_String (s : in UStr.Unbounded_String) return ClaimRecord is
      ThisClaim : ClaimRecord :=
         (num => 0, cstart => (x => 0, y => 0), cend => (x => 0, y => 0));
      NumIndex : Integer := -1;
      XIndex : Integer := -1;
      YIndex : Integer := -1;
      WIndex : Integer := -1;
      HIndex : Integer := -1;
   begin
      --  Claim structure: #1 @ 1,3: 4x4
      --                    N   X Y  W H

      NumIndex := UStr.Index (Source => s, Pattern => "#") + 1;
      XIndex := UStr.Index (Source => s, Pattern => "@") + 2;
      YIndex := UStr.Index (Source => s, Pattern => ",") + 1;
      WIndex := UStr.Index (Source => s, Pattern => ":") + 2;
      HIndex := UStr.Index (Source => s, Pattern => "x") + 1;

      ThisClaim.num := Integer'Value (UStr.Slice (s, NumIndex, XIndex - 4));

      ThisClaim.cstart.x := Integer'Value (UStr.Slice (s, XIndex, YIndex - 2));
      ThisClaim.cstart.y := Integer'Value (UStr.Slice (s, YIndex, WIndex - 3));

      ThisClaim.cend.x :=
         ThisClaim.cstart.x +
         Integer'Value (UStr.Slice (s, WIndex, HIndex - 2)) - 1;

      ThisClaim.cend.y :=
         ThisClaim.cstart.y +
         Integer'Value (UStr.Slice (s, HIndex, UStr.Length (s))) - 1;

      return ThisClaim;
   end From_String;

   procedure Print (c : in ClaimRecord) is
   begin
      Ada.Text_IO.Put ("#");
      Ada.Integer_Text_IO.Put (c.num, Width => 0);
      Ada.Text_IO.Put (" @ ");
      Ada.Integer_Text_IO.Put (c.cstart.x, Width => 0);
      Ada.Text_IO.Put (",");
      Ada.Integer_Text_IO.Put (c.cstart.y, Width => 0);
      Ada.Text_IO.Put (": ");
      Ada.Integer_Text_IO.Put (c.cend.x - c.cstart.x + 1, Width => 0);
      Ada.Text_IO.Put ("x");
      Ada.Integer_Text_IO.Put (c.cend.y - c.cstart.y + 1, Width => 0);
      Ada.Text_IO.Put (": ");
      Ada.Integer_Text_IO.Put (c.cend.x, Width => 0);
      Ada.Text_IO.Put (",");
      Ada.Integer_Text_IO.Put (c.cend.y, Width => 0);
      Ada.Text_IO.Put_Line ("");
   end Print;

   function Translate (
      c : in ClaimRecord; x : in Integer; y : in Integer) return ClaimRecord is
      new_claimrecord : constant ClaimRecord := (
         num => c.num,
         cstart => (x => c.cstart.x + x, y => c.cstart.y + y),
         cend => (x => c.cend.x + x, y => c.cend.y + y)
      );
   begin
      return new_claimrecord;
   end Translate;
end Claim;
