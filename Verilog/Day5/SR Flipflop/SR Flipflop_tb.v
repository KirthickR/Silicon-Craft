module sr_flipflop_tb();
reg s;
reg r;
reg clk;
reg rst;
wire q;
wire qb;

sr_flipflop dut(.s(s),.r(r),.clk(clk),.rst(rst),.q(q),.qb(qb));

initial
begin
	$dumpfile("waves.vcd");
	$dumpvars();
end

initial
	begin
	clk =0;
	forever #10 clk=~clk;
	end

	initial
	begin
		$display("s=%b,r=%b, clk=%b, rst=%b, q=%b, qb=%b", s,r,clk,rst,q,qb);
		
		s=0; r=0; rst=0; #10;
		s=1; r=1; rst=0; #10;
		s=0; r=1; rst=0; #10;
		s=1; r=1; rst=0; #10;
		repeat(5) begin
			s=$random;
			r=$random;
			rst=0;
			#15;
		end
		$finish;
	end


endmodule
