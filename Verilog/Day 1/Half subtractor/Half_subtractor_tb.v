module half_subtractor_tb();
reg a,b;
wire difference,borrow;
half_subtractor dut(.a(a),.b(b),.borrow(borrow),.difference(difference));
initial
	begin
	$dumpfile("waves.vcd");
	$dumpvars();
end
initial 
	begin
 	a=0;b=0; #10;
	a=0;b=1; #10;	
	a=1;b=0; #10;	
	a=1;b=1; #10;		
$monitor("a=%b,b=%b,difference=%b,borrow=%b",a,b,difference,borrow);
end
endmodule
