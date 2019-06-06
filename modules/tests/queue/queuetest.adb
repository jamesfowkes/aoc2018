with Ada.Integer_Text_IO;
with Ada.Text_IO;

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Containers; use Ada.Containers;
with queue;

package body QueueTest is

   package Int_Queue is new Queue(Integer);
   use Int_Queue;

   procedure Set_Up (T : in out Test_Case) is
   begin
      null;
   end Set_Up;

   procedure Tear_Down (T : in out Test_Case) is
   begin
      null;
   end Tear_Down;

   procedure EmptyQueue (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_queue : Queue_Type;
   begin
      Assert (Is_Empty (test_queue), "Expected empty queue to be empty");
      Assert (Length (test_queue) = 0, "Expected empty queue to have zero length");
   end EmptyQueue;

   procedure AddingObjectsToQueue (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_queue : Queue_Type;
   begin
      Push (test_queue, 1);
      Assert (not Is_Empty (test_queue), "Expected queue to not be empty");
      Assert (Length (test_queue) = 1, "Expected queue to have length 1");
      Push (test_queue, 2);
      Assert (not Is_Empty (test_queue), "Expected queue to not be empty");
      --  Ada.Integer_Text_IO.Put (Length (test_queue));
      --  Ada.Text_IO.Put_Line ("");
      Assert (Length (test_queue) = 2, "Expected queue to have length 2");
   end AddingObjectsToQueue;

   procedure Register_Tests (T : in out Test_Case) is
      use Test_Cases, Test_Cases.Registration;
   begin
      Register_Routine (T, EmptyQueue'Access, "Initialising a queue");
      Register_Routine (T, AddingObjectsToQueue'Access, "Adding to a queue");
   end Register_Tests;

   function Name (T : Test_Case) return Message_String is
   begin
      return Format ("Test Queue package");
   end Name;

end QueueTest;
