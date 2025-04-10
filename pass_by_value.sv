module test();
int value=100;
 
  function void bhejo_value( int func_value);
    func_value = func_value+200;
    $display("bhejo value function ke ander ki value func_value=%d",func_value);
  endfunction
  
initial begin
  bhejo_value(value);
  $display("bhejo value function ke baad ki value value=%d",value);
end
endmodule
