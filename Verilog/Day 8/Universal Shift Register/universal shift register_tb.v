// Code your testbench here
// or browse Examples
module universal_shift_tb();
reg [3:0] data_in;
reg clk,rst;
reg [1:0] sel;
reg shift_left;
reg shift_right;
wire [3:0] data_out;

universal_shift dut (.data_in(data_in),.clk(clk),.rst(rst),.sel(sel),.shift_right(shift_right),.shift_left(shift_left),.data_out(data_out));

initial 
begin
	$dumpfile("waves.vcd");
	$dumpvars();
end

initial 
begin
	clk=0;
	rst=0;
	sel=2'b00;
	forever #5 clk=~clk;
end
initial 
begin
  $monitor("data_in=%b, clk=%b, rst=%b, sel=%b, shift_right=%b, shift_left=%b,data_out=%b ", data_in,clk,rst,sel,shift_right,shift_left,data_out);
	rst=1; clk=0; sel=2'b00; data_in=4'b1001; shift_left=2;#10;
	rst=0; clk=1; sel=2'b00; data_in=4'b1101;  #10;
	sel=2'b01; shift_right=1; #10;
	sel=2'b11; #10;
  sel=2'b00;
	#50 $finish;
end


endmodule
