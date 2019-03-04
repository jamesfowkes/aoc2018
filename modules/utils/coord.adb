with Ada.Strings.Hash;
with Ada.Strings.Fixed;

package body Coord is

   function To_String (c : in Coordinate) return String is
   begin
      return Ada.Strings.Fixed.Trim (Integer'Image (c.x), Ada.Strings.Left) &
         "," &
         Ada.Strings.Fixed.Trim (Integer'Image (c.y), Ada.Strings.Left);
   end To_String;

   function Hash (c : in Coordinate) return Ada.Containers.Hash_Type is
   begin
      return Ada.Strings.Hash (To_String (c));
   end Hash;

   function "=" (c1 : in Coordinate; c2 : in Coordinate) return Boolean is
   begin
      return (c1.x = c2.x) and (c1.y = c2.y);
   end "=";

   function From_String (s : in String) return Coordinate is
      NewCoord : Coordinate := (x => 0, y => 0);
      CommaIndex : Integer;
   begin
      CommaIndex := Ada.Strings.Fixed.Index (Source => s, Pattern => ",");
      NewCoord.x := Integer'Value (s (s'First .. CommaIndex - 1));
      NewCoord.y := Integer'Value (s (CommaIndex + 1 .. s'Last));
      return NewCoord;
   end From_String;

   function Manhattan (
      c1 : in Coordinate;
      c2 : in Coordinate) return Integer is
   begin
      return Manhattan (c1, c2.x, c2.y);
   end Manhattan;

   function Manhattan (c1 : in Coordinate; x : Integer; y : Integer) return Integer is
   begin
      return abs (c1.x - x) + abs (c1.y - y);
   end Manhattan;

   function Under (c1 : in Coordinate; c2 : in Coordinate) return Boolean is
   begin return c1.y < c2.y;
   end Under;

   function Over (c1 : in Coordinate; c2 : in Coordinate) return Boolean is
   begin return c1.y > c2.y;
   end Over;

   function LeftOf (c1 : in Coordinate; c2 : in Coordinate) return Boolean is
   begin return c1.x < c2.x;
   end LeftOf;

   function RightOf (c1 : in Coordinate; c2 : in Coordinate) return Boolean is
   begin return c1.x > c2.x;
   end RightOf;

   function GetBounds (coords : CoordVector.Vector) return Box is
      bounds : Box := (
         min => (x => Integer'Last, y => Integer'Last),
         max => (x => Integer'First, y => Integer'First)
      );
   begin
      for C : Coord.Coordinate of coords loop
         bounds.min.x := Integer'Min (C.x, bounds.min.x);
         bounds.min.y := Integer'Min (C.y, bounds.min.y);
         bounds.max.x := Integer'Max (C.x, bounds.max.x);
         bounds.max.y := Integer'Max (C.y, bounds.max.y);
      end loop;
      return bounds;
   end GetBounds;

end Coord;
