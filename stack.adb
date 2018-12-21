package body stack is
    data : array (1.. max) of item;
    top: Integer range 0..max;

    procedure push(push_data: in item) is
    begin
        top := top + 1;
        data(top) := push_data;

    end push;

    procedure pop(pop_data: out item) is
    begin
        if top >= 1 then
            pop_data := data(top);
            top := top - 1;
        end if;
    end pop;
    
    function empty return Boolean is
    begin
        return top = 0;
    end empty;

begin
    top := 0;
end;