class parent;
 virtual task display();
   $display("----------->  printing from parent <---------------");
  endtask
endclass
class child extends parent;
  task display(); 
    $display("----------------> printing from child <----------------");
  endtask
endclass
module tb;
parent p1;
  child c1,c2;
  initial begin
    c1=new();
  p1=c1;
    p1.display;
    $cast(c2,p1);
    c2.display;
  end
endmodule
