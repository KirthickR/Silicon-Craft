module onetotwo_mux_tb();
reg y;
reg sel;
wire i0,i1;

onetotwo_mux dut(.y(y),.sel(sel),.i0(i0),.i1(i1));
initial
	begin
		$dumpfile("waves.vcd");
		$dumpvars();
	end
	initial 
	begin
		$display("y=%b, sel=%b, i0=%b, i1=%b",y,sel,i0,i1);
		sel=0; y=0;  #10;
		sel=1; y=1;  #10;
	
	end

endmodule
