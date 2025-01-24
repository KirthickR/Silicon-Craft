module full_subtractor_tb();
reg a,b,bin;
wire difference,borrow;
full_subtractor dut(.a(a),.b(b),.bin(bin),.difference(difference),.borrow(borrow));

initial
	begin
	$dumpfile("waves.vcd");
	$dumpvars();
end
integer i,j,k;
initial
begin
for(i=0;i<8;i=i+1)begin
	for(j=0;j<8;j++)begin
		for(k=0;k<8;k++)begin


a=i[2:0];
b=j[2:0];
bin=k[2:0];
#15;
end
	end
		end

$monitor("a=%b,b=%b,bin=%b,difference=%b,borrow=%b",a,b,bin,difference,borrow);
#15;
$finish;
end
	endmodule
