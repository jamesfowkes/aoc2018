generic
   type Element_Type is private;

package Queue is
   type Queue_Type is private;
   type QueueElementPrinterType is access procedure (E : Element_Type);

   procedure Push (List : in out Queue_Type; Item : in Element_Type);
   procedure Pop (List : in out Queue_Type; Item : out Element_Type);
   procedure Peek (List : in out Queue_Type; Item : out Element_Type);

   function Is_Empty (List : Queue_Type) return Boolean;
   function Length (List : Queue_Type) return Integer;

   procedure Print (List : Queue_Type; PrinterFn : QueueElementPrinterType);

   Empty_Error : exception;

private

   type Queue_Element;
   type Queue_Ptr is access Queue_Element;
   type Queue_Type is record
      Head : Queue_Ptr := null;
      Tail : Queue_Ptr := null;
   end record;
   type Queue_Element is record
      Value : Element_Type;
      Next  : Queue_Ptr := null;
   end record;

end Queue;
