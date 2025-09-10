class packet;
rand int a[];
  int b[10];
constraint s1{a.size()==10;}
constraint c1{foreach (a[i]) 
              a[i] inside {[20:70]};}

function void post_randomize();
foreach(a[i])
$display("%d",a[i]);
endfunction

function int rev(input int a[]);
  for(int i=0;i<$size(a);i++)
   begin
  b[i]=a[$size(a)-i-1];
   end
  foreach(a[i])
  a[i]=b[i];
  foreach (a[i])
    $display("array after reverse is %d",a[i]);
endfunction
endclass


module tb;
packet pkt;
initial begin
pkt=new();
assert(pkt.randomize());
pkt.rev(pkt.a);
end
endmodule
