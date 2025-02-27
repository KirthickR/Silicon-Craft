module bcd_counter_tb();
  reg clk;
  reg rst;
  reg in;
  wire [3:0] out;
  
  bcd_counter dut(.in(in),.clk(clk),.rst(rst),.out(out));
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars();
  end
  
  always #5 clk=~clk;
  
  initial 
    begin
//        $display("time=%0t, in=%b, clk=%b, rst=%b, out=%d",$time, in, clk,rst, out);
      
      clk=0;
      rst=1;
      
      clk =1; rst = 0; #5;
      #10 in=0;
      
// #100 $finish;
      
      $monitor("time=%0t, in=%b, clk=%b, rst=%b, out=%d",$time, in, clk,rst, out);
      #100 $finish;
    end
endmodule
     
