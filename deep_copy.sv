 class tannu;
int big;
function tannu copy();
copy=new();
copy.big=this.big;
endfunction
endclass

class tushar;
int smaller;
tannu ta;
function new();
ta=new();
endfunction
function tushar copy();
copy=new();
copy.smaller = this.smaller;
copy.ta = this.ta.copy;
endfunction
endclass

module test;
tushar t1,t2;
initial begin
t1=new();
t1.smaller = 9;
t1.ta.big  = 1;
t2=t1.copy;
t2.ta.big=6;
$display("%0d ",t1.smaller);
$display("%0d ",t1.ta.big);
$display("%0d ",t2.ta.big);

end
endmodule
