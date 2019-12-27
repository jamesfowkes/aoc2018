with Ada.Integer_Text_IO;
with Ada.Text_IO;

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Containers; use Ada.Containers;
with queue;

package body QueueTest is

   procedure QueuePrinter(val : Integer) is
   begin
      Ada.Integer_Text_IO.Put (val);
   end QueuePrinter;

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
      Assert (Length (test_queue) = 2, "Expected queue to have length 2");
   end AddingObjectsToQueue;

   procedure PeekingIntoQueue (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_queue : Queue_Type;
      peeked : Integer;
   begin
      Push (test_queue, 1);
      Peek (test_queue, peeked);
      Assert (peeked = 1, "Expected peeked item to be 1");

      Push (test_queue, 2);
      Peek (test_queue, peeked);
      Assert (peeked = 1, "Expected peeked item to be 1");

      Push (test_queue, 3);
      Peek (test_queue, peeked);
      Assert (peeked = 1, "Expected peeked item to be 1");

   end PeekingIntoQueue;

   procedure RemovingObjectsFromQueue (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_queue : Queue_Type;
      popped : Integer;
   begin
      Push (test_queue, 1);
      Push (test_queue, 2);
      Push (test_queue, 3);
      
      Pop (test_queue, popped);
      
      Assert (popped = 1, "Expected popped item to be 1");
      Assert (Length (test_queue) = 2, "Expected queue to have length 2");
      Assert (not Is_Empty (test_queue), "Expected queue to not be empty");
      
      Pop (test_queue, popped);
      Assert (popped = 2, "Expected popped item to be 2");
      Assert (Length (test_queue) = 1, "Expected queue to have length 1");
      Assert (not Is_Empty (test_queue), "Expected queue to not be empty");      
      
      Pop (test_queue, popped);
      Assert (popped = 3, "Expected popped item to be 3");
      Assert (Length (test_queue) = 0, "Expected queue to have length 0");
      Assert (Is_Empty (test_queue), "Expected queue to be empty");      
   end RemovingObjectsFromQueue;

   procedure Register_Tests (T : in out Test_Case) is
      use Test_Cases, Test_Cases.Registration;
   begin
      Register_Routine (T, EmptyQueue'Access, "Initialising a queue");
      Register_Routine (T, AddingObjectsToQueue'Access, "Adding to a queue");
      Register_Routine (T, PeekingIntoQueue'Access, "Peeking into a queue");
      Register_Routine (T, RemovingObjectsFromQueue'Access, "Removing from a queue");
   end Register_Tests;

   function Name (T : Test_Case) return Message_String is
   begin
      return Format ("Test Queue package");
   end Name;

end QueueTest;
