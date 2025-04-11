module test();
event ev;
  
 initial begin
   $display("about to drive ctrl after 10 time units");
   #10;
   $display("control is driven at time,t=%t",$time);
   -> ev;
 end
  initial begin
    $display("about to drive data");
    #10;
    //wait (ev.triggered);           //wait for event including this time slot                    
    @ (ev);                          // @ (ev) see output will change as @ does not include this time slot
    $display("data is driven at time ,t=%t",$realtime);
  end
endmodule
