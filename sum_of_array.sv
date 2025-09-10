class packet;
rand int a[];  
  int sum;

  constraint s1{a.size()==5;}
  
  constraint c1{foreach (a[i])
                 a[i] inside {[20:70]}
               ;}
function void post_randomize();
 foreach (a[i])
  $display("%d",a[i]);  
 endfunction
  
function int summ(input int a[]);
  foreach(a[i])
    sum+=a[i];
  $display("===========>%d",sum);
endfunction
  
endclass

module tb;
packet pkt;
initial begin
pkt=new();
assert(pkt.randomize());
  pkt.summ(pkt.a);
end
  
endmodule
