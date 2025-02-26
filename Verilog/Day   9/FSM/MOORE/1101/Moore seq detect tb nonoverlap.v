`timescale 1ns/1ps

module seqdete1101_moore_tb();
  reg clk;
  reg rst;
  reg in;
  wire dout;
  
 
  seqdetect_1101_moore dut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .dout(dout)
  );

 
  always #5 clk = ~clk;  

 
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars();
  end

 
  initial begin
    clk = 0;
    rst = 1; 
    in = 0;

    #10 rst = 0;  

   
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;  

    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;  

    #10 in = 1;
    #10 in = 0;
    #10 in = 1; 

    #50 $finish;  
  end


  initial begin
    $monitor("Time=%0t | clk=%b | rst=%b | in=%b | dout=%b", $time, clk, rst, in, dout);
  end
endmodule
