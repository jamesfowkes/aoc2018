with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Claim is

   function ClaimsOverlap (c1 : in ClaimRecord; c2 : in ClaimRecord) return Boolean is
   begin
      return (
         (c1.cstart.x <= c2.cend.x) and
         (c1.cend.x >= c2.cstart.x) and
         (c1.cstart.y <= c2.cend.y) and
         (c1.cend.y >= c2.cstart.y)
      );
   end ClaimsOverlap;

   function FromString (s : in UStr.Unbounded_String) return ClaimRecord is
      this_claim : ClaimRecord := (num => 0, cstart => (x => 0, y => 0), cend => (x => 0, y => 0));
      num_index : Integer := -1;
      x_index : Integer := -1;
      y_index : Integer := -1;
      w_index : Integer := -1;
      h_index : Integer := -1;
   begin
      --  Claim structure: #1 @ 1,3: 4x4
      --                    N   X Y  W H

      num_index := UStr.Index (Source => s, Pattern => "#") + 1;
      x_index := UStr.Index (Source => s, Pattern => "@") + 2;
      y_index := UStr.Index (Source => s, Pattern => ",") + 1;
      w_index := UStr.Index (Source => s, Pattern => ":") + 2;
      h_index := UStr.Index (Source => s, Pattern => "x") + 1;

      this_claim.num := Integer'Value (UStr.Slice (s, num_index, x_index - 4));

      this_claim.cstart.x := Integer'Value (UStr.Slice (s, x_index, y_index - 2));
      this_claim.cstart.y := Integer'Value (UStr.Slice (s, y_index, w_index - 3));

      this_claim.cend.x := this_claim.cstart.x + Integer'Value (UStr.Slice (s, w_index, h_index - 2)) - 1;

      this_claim.cend.y := this_claim.cstart.y + Integer'Value (UStr.Slice (s, h_index, UStr.Length (s))) - 1;

      return this_claim;
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

   function Translate (c : in ClaimRecord; x : in Integer; y : in Integer) return ClaimRecord is
      new_claimrecord : constant ClaimRecord := (
         num => c.num,
         cstart => (x => c.cstart.x + x, y => c.cstart.y + y),
         cend => (x => c.cend.x + x, y => c.cend.y + y)
      );
   begin
      return new_claimrecord;
   end Translate;
end Claim;
