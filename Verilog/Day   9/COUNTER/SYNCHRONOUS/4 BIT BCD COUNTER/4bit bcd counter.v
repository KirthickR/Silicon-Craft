module bcd_counter(in,clk,rst,out);
  input in;
  input rst;
  input clk;
  output reg [3:0] out;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        out<=4'b0000;
      else if(out<4'b1001)
        out<=out + 1;
      else 
        out<=0;
//       $display("time=%0t, in=%b, clk=%b, rst=%b, out=%d",$time, in, clk,rst, out);
    end
endmodule
  
  
