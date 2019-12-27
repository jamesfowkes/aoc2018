with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Queue is

   ----------
   -- Push --
   ----------

   procedure Push (List : in out Queue_Type; Item : in Element_Type) is
      New_Item : constant Queue_Ptr := new Queue_Element'(Item, null);
   begin
      if not Is_Empty (List) then
         List.Tail.Next := New_Item;
         List.Tail := New_Item;
      else
         List.Head := New_Item;
         List.Tail := New_Item;
      end if;
   end Push;

   ---------
   -- Pop --
   ---------

   procedure Pop (List : in out Queue_Type; Item : out Element_Type) is
   begin
      if List.Head = null then
         raise Empty_Error;
      end if;

      Item := List.Head.Value;
      List.Head := List.Head.Next;
   end Pop;

   procedure Peek (List : in out Queue_Type; Item : out Element_Type) is
   begin
      if List.Head = null then
         raise Empty_Error;
      else
         Item := List.Head.Value;
      end if;
   end Peek;

   --------------
   -- Is_Empty --
   --------------

   function Is_Empty (List : Queue_Type) return Boolean is
   begin
      return List.Head = null;
   end Is_Empty;


   function Length (List : Queue_Type) return Integer is
      count : Integer := 0;
      node : Queue_Ptr;
   begin
      if Is_Empty (List) then
         return 0;
      else
         count := 1;
         node := List.Tail;
         while node.Next /= null loop
            --  Ada.Integer_Text_IO.Put (node.Value);
            --  Ada.Text_IO.Put_Line ("");
            node := node.Next;
            count := count + 1;
         end loop;
      end if;
      return count;
   end Length;

   procedure Print (List : Queue_Type; PrinterFn : QueueElementPrinterType) is
      element : Queue_Ptr;
   begin
      if Is_Empty (List) then
         Ada.Text_IO.Put_Line ("Queue Empty");
         return;
      else
         Ada.Text_IO.Put ("Queue has ");
         Ada.Integer_Text_IO.Put (Length (List), Width => 0);
         Ada.Text_IO.Put (" elements: ");
      end if;

      element := List.Tail;
      while element.Next = null loop
         PrinterFn (element.Value);
         Ada.Text_IO.Put (",");
         element := element.Next;
      end loop;
   end Print;

end Queue;
