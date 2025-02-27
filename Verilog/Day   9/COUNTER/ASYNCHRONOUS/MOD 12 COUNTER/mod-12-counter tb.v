module modtwelve_counter_tb();
  reg in;
  reg clk;
  reg rst;
  wire [3:0] out;
  
  modtwelve_counter dut(.in(in),.clk(clk), .rst(rst),.out(out));
  
  always #5 clk = ~clk;

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars();
    clk = 0;
    rst = 1;
    #10;
    clk=0;
    rst=0;
    in=1;
    
    $monitor("time=%0t, clk=%b , rst=%b , in=%b, out=%d", $time, clk, rst, in, out);
    
    #140 $finish;
  end
endmodule
