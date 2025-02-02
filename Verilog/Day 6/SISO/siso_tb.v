// Code your testbench here
// or browse Examples
module siso_tb();
  reg  data_in;
  reg  clk;
  reg  rst;
  wire data_out;
  
  siso  dut(.data_in(data_in),.clk(clk),.rst(rst),.data_out(data_out));
  
  initial 
  begin 
  $dumpfile("waves.vcd");
  $dumpvars();
  end

  initial
    begin
	    clk=0;
      forever #5 clk=~clk;
    end
  
    initial
    begin
	    $monitor("data_in=%b,clk=%b,rst=%b,data_out=%b",data_in,clk,rst,data_out);
	     clk=0;rst=1; #15;
	    rst=0; clk=1;
	    data_in=1; #10;
	    data_in=0; #10;
	    data_in=1; #10;
	    data_in=1; #10;
	 #50   $finish;
    end
    endmodule
	    
