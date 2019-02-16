with AUnit.Assertions; use AUnit.Assertions;
with Ada.Containers; use Ada.Containers;
with Ada.Strings.Unbounded;

with Coord;

package body CoordTest is

   package UStr renames Ada.Strings.Unbounded;

   procedure Set_Up (T : in out Test_Case) is
   begin
      null;
   end Set_Up;

   procedure Tear_Down (T : in out Test_Case) is
   begin
      null;
   end Tear_Down;

   procedure CoordCreationFromString (R : in out AUnit.Test_Cases.Test_Case'Class) is
      TestCoordinate : Coord.Coordinate := (x => Integer'First, y => Integer'First);
   begin
      TestCoordinate := Coord.From_String("1,2");
      Assert (TestCoordinate.x = 1, "Coordinate x should equal 1");
      Assert (TestCoordinate.y = 2, "Coordinate y should equal 2");
      TestCoordinate := Coord.From_String("3, 4");
      Assert (TestCoordinate.x = 3, "Coordinate x should equal 3");
      Assert (TestCoordinate.y = 4, "Coordinate y should equal 4");
      TestCoordinate := Coord.From_String("5 ,6");
      Assert (TestCoordinate.x = 5, "Coordinate x should equal 5");
      Assert (TestCoordinate.y = 6, "Coordinate y should equal 6");
   end CoordCreationFromString;

   procedure Register_Tests (T : in out Test_Case) is
      use Test_Cases, Test_Cases.Registration;
   begin
      Register_Routine (T, CoordCreationFromString'Access, "Creation of a coordinate from a string");
   end Register_Tests;

   function Name (T : Test_Case) return Message_String is
   begin
      return Format ("Test Coord package");
   end Name;

end CoordTest;
