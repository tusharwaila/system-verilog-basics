//given a dynamic array of size 15 .how you will manage to find out the second largest element??
module tb;
bit[7:0]a[];
initial begin
a=new[15];
a='{3,4,8,5,22,52,11,25,43,52,35,63,64,72,72};
foreach(a[i])
$display("array_element[%d]=%d",i,a[i]);
a.sort();
foreach(a[i])
$display("sorted_element[%d]=%d",i,a[i]);
for(int i=a.size-1;i>=0;i--)
begin
if(a[i]<a[a.size-1])
begin
$display("--------------------------------------------");
$display("required_number_from_the_array=%d",a[i]);
$display("--------------------------------------------");
break;
end
end
end
endmodule
