module d_ff_tb();
reg d;
reg clk;
reg rst;
wire q;

d_ff dut(.d(d),.clk(clk),.rst(rst),.q(q));
initial 
	begin
		$dumpfile("waves.vcd");
		$dumpvars();
	end
	initial
		repeat(3) begin
		clk = 0;
		#5 clk = 1;
		#10 clk =0;	
       end
initial
 	begin 
		$monitor("d=%b, clk=%b, rst=%b, q=%b",d,clk,rst,q);
		repeat (5) begin
			rst=0; #20;
			d=$random; 
		
	end
	$finish;
	end
endmodule
