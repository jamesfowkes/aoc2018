generic
   max : Integer;
   type item is private;

package stack is

   procedure push (push_data : in item);
   procedure pop (pop_data : out item);
   function empty return Boolean;

end stack;