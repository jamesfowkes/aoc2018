with Ada.Unchecked_Deallocation;
--  with Ada.Integer_Text_IO;
--  with Ada.Text_IO;

package body Queue is

   ----------
   -- Push --
   ----------

   procedure Push (List : in out Queue_Type; Item : in Element_Type) is
      Temp : constant Queue_Ptr := new Queue_Element'(Item, null);
   begin
      if List.Head = null then
         List.Head := Temp;
      end if;
      if List.Tail /= null then
         List.Tail.Next := Temp;
      else
         List.Tail := Temp;
      end if;
   end Push;

   ---------
   -- Pop --
   ---------

   procedure Pop (List : in out Queue_Type; Item : out Element_Type) is
      procedure Free is new Ada.Unchecked_Deallocation (
         Queue_Element, Queue_Ptr
      );
      Temp : Queue_Ptr := List.Tail;
   begin
      if List.Head = null then
         raise Empty_Error;
      end if;
      Item := List.Tail.Value;
      List.Tail := List.Tail.Next;
      if List.Tail = null then
         List.Head := null;
      end if;
      Free (Temp);
   end Pop;

   procedure Peek (List : in out Queue_Type; Item : out Element_Type) is
   begin
      if List.Head = null then
         raise Empty_Error;
      else
         Item := List.Tail.Value;
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
         node := List.Head;
         while node.Next /= null loop
            --  Ada.Integer_Text_IO.Put (node.Value);
            --  Ada.Text_IO.Put_Line ("");
            node := node.Next;
            count := count + 1;
         end loop;
      end if;
      return count;
   end Length;

end Queue;
