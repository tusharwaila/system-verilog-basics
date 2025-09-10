class packet;
rand int a[];

constraint c1 {a.size()==10;}

constraint c2{foreach (a[i])
              a[i] inside {[20:80]};
             }

function void post_randomize();
foreach(a[i])
$display("------>%d",a[i]);
endfunction
endclass


module tb;
int result;
packet pkt;

function int max(input int a[]);
int max_value;
max_value=a[0];
foreach (a[i])
begin
if(a[i]>max_value)
max_value=a[i];
end
return max_value;
endfunction

initial begin
pkt=new();
assert(pkt.randomize());
max(pkt.a);
result=max(pkt.a);
$display("++++++++++++++++++%d",result);
end
endmodule
