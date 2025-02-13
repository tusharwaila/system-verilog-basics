module art;
event  ev_any,ev_none;
initial
begin
fork

begin
->ev_none;
#5 $display($time,"from block b1");
->ev_any;
end


begin
->ev_none;
#10 $display($time,"from block b2");
->ev_any;
end


begin
  wait(ev_any.triggered);//write ev_none in the argument to behave it like for_join_none

$display($time,"from outside fork join block");
end

join
end
endmodule

