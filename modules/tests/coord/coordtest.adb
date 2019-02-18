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

   procedure CoordToString (R : in out AUnit.Test_Cases.Test_Case'Class) is
      TestCoordinate : Coord.Coordinate := (x => Integer'First, y => Integer'First);
   begin
      TestCoordinate := Coord.From_String("1,2");
      Assert (Coord.To_String(TestCoordinate) = "1,2", "Coordinate string should equal 1,2");
   end CoordToString;

   procedure CoordManhattanDistance (R : in out AUnit.Test_Cases.Test_Case'Class) is
      TestCoordinate1 : Coord.Coordinate := (x => 0, y => 0);
      TestCoordinate2 : Coord.Coordinate := (x => 0, y => 0);
   begin
      Assert (Coord.Manhattan (TestCoordinate1, TestCoordinate2) = 0, "Distance between equal coordinates should equal 0");
      TestCoordinate1.x := 1;
      Assert (Coord.Manhattan (TestCoordinate1, TestCoordinate2) = 1, "Distance between coordinates should equal 1");
      TestCoordinate1.y := 1;
      Assert (Coord.Manhattan (TestCoordinate1, TestCoordinate2) = 2, "Distance between coordinates should equal 2");
      TestCoordinate2.x := -1;
      Assert (Coord.Manhattan (TestCoordinate1, TestCoordinate2) = 3, "Distance between coordinates should equal 3");
      TestCoordinate2.y := -1;
      Assert (Coord.Manhattan (TestCoordinate1, TestCoordinate2) = 4, "Distance between coordinates should equal 4");
   end CoordManhattanDistance;

   procedure Register_Tests (T : in out Test_Case) is
      use Test_Cases, Test_Cases.Registration;
   begin
      Register_Routine (T, CoordCreationFromString'Access, "Creation of a coordinate from a string");
      Register_Routine (T, CoordToString'Access, "Creation of a string from a coordinate");
      Register_Routine (T, CoordManhattanDistance'Access, "Calculation of Manhattan distance between two coords");
   end Register_Tests;

   function Name (T : Test_Case) return Message_String is
   begin
      return Format ("Test Coord package");
   end Name;

end CoordTest;
