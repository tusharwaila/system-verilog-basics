//  process 1 then process3 after completing 2 and all three completed then 4 process

// -------------------->        using fork  <----------------------------------------
module tb;
task process1();
$display("process1 k ander");
endtask
task process2();
$display("process2 k ander");
endtask
task process3();
$display("process3 k ander");
endtask
task process4();
$display("process4 k ander");
endtask

initial begin
fork
process1();
process2();
join_any
process3();
wait fork;
process4();
end
endmodule


//-------------------------------------------->    using event  <-------------------------------------------------------------
module tb;
event ev,ev_i,ev_1;

task process1();
$display("process1 k ander");
->ev;
endtask


task process2();
wait(ev_i.triggered);
$display("process2 k ander");
->ev_1;
endtask


task process3();
wait(ev.triggered);
$display("process3 k ander");
->ev_i;
endtask


task process4();
wait(ev_1.triggered);
$display("process4 k ander");
endtask

initial begin
fork
process1();
process2();
process3();
process4();
join
end
endmodule


//-------------------------->  using semaphore  <------------------------------------------------------------
  module tb;
  semaphore sem1, sem2, sem3;  // Semaphores for synchronization

  initial begin
    sem1 = new(0);  // Locked initially
    sem2 = new(0);  // Locked initially
    sem3 = new(0);  // Locked initially
    
    fork
      process1();
      process3();
      process2();
      process4();
    join_none
  end

  task process1();
    begin
      $display("[%0t] Process 1 Started", $time);
      $display("[%0t] Process 1 Completed", $time);
      sem1.put(1);  // Unlock process 3
    end
  endtask

  task process3();
    begin
      sem1.get(1);  // Wait for process 1 to complete
      $display("[%0t] Process 3 Started", $time);
      $display("[%0t] Process 3 Completed", $time);
      sem2.put(1);  // Unlock process 2
    end
  endtask

  task process2();
    begin
      sem2.get(1);  // Wait for process 3 to complete
      $display("[%0t] Process 2 Started", $time);
      $display("[%0t] Process 2 Completed", $time);
      sem3.put(1);  // Unlock process 4
    end
  endtask

  task process4();
    begin
      sem3.get(1);  // Wait for process 2 to complete
      $display("[%0t] Process 4 Started", $time);
      $display("[%0t] Process 4 Completed", $time);
    end
  endtask

endmodule


