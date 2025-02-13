class tannu;
int big;
endclass

class tushar;
tannu ta;
int smaller;
function  new();
 ta = new();
endfunction
endclass

module test;
tushar t1,t2;
initial begin
t1=new();
t1.smaller =9;
t1.ta.big=1;
t2 = new t1;
t2.ta.big=6;
t2.smaller = 4;

$display("%0d ",t1.smaller);
$display("%0d ",t1.ta.big);
end
endmodule
