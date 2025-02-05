// Code your testbench here
// or browse Examples
module lfsr_tb();
 // reg [3:0] data_in;
  reg rst,clk;
  wire [3:0] data_out;
  
  lfsr dut(.rst(rst),.clk(clk),.data_out(data_out));
  
  initial
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
    end
  
  initial
    begin
  		clk=0;
      rst=0;
      forever #5 clk =~clk;
    end
  
  initial 
    begin
      $monitor(" clk=%b, rst=%b, data_out=%b",clk,rst,data_out);
      rst=1;#3;  //data_in=4'b1011; #5;
      rst=0; //data_in=4'b1101; #10;
      
      #40 ;
      $finish;
    end
endmodule
