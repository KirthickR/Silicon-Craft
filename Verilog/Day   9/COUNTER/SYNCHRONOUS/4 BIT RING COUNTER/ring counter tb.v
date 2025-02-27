// Code your testbench here
// or browse Examples
module ring_counter_tb();
  reg clk;
//   reg in;
  reg rst;
  wire [3:0] out;
  
  ring_counter dut(.clk(clk),.rst(rst),.out(out));
  
  initial
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
    end
  always #5 clk = ~clk;
  initial begin
    
    clk=0;
    rst=1;
    #20;
//     in = 0;
     rst=0;
  
    $monitor("time=%0t, clk=%b,  rst=%b, out=%d", $time,clk,rst,out);
    #100 $finish;
  end
endmodule
    
