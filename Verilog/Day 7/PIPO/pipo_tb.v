// Code your testbench here
// or browse Examples
module pipo_tb();
  reg [3:0] data_in;
  reg clk,rst;
  wire [3:0] data_out;
  
  pipo dut(.data_in(data_in),.rst(rst),.clk(clk),.data_out(data_out));
  
  initial 
    begin
      $dumpfile("waves.vcd");
      $dumpvars;
    end
  
  initial 
    begin
      clk=0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      $monitor("data_in=%b,rst=%b, clk=%b, data_out=%b",data_in, rst, clk, data_out);
      rst=1; data_in=4'b0011; #10;
      rst=0; data_in=4'b1011; #10;
      data_in=4'b1111; #10;
      #40 $finish;
    end
endmodule
      
