module fourtoone_mux_tb();
reg [3:0] data_in;
reg [1:0] sel_in;
wire y;
fourtoone_mux dut(.data_in(data_in),.sel_in(sel_in),.y(y));
initial
	begin
	$dumpfile("waves.vcd");
	$dumpvars();
end

initial 
	begin
	$monitor("data_in=%b, sel_in=%b, y=%b",data_in,sel_in,y);

	sel_in= 2'b00 ;data_in=4'b0000; #10;
	sel_in= 2'b01 ;data_in=4'b1101; #10;
	sel_in= 2'b10 ;data_in=4'b1010; #10;
	sel_in= 2'b11 ;data_in=4'b1111; #10;
	
end
	endmodule


	
