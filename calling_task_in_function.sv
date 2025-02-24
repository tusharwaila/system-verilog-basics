class art;
function void post();
fork
papa();
join_none
endfunction
task papa();
#5;
$display($realtime,"----------> bol beta");
endtask
endclass

module tb;
art ary;
initial begin
ary=new();
ary.post();
end
endmodule
