// Code your design here
module lfsr #(parameter WIDTH=4)( clk,rst, data_out);
 // input [WIDTH -1:0] data_in;
  input rst,clk;
  output reg [WIDTH -1:0] data_out;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        data_out<=4'b1000;
      else
        data_out<={data_out[0]^data_out[1],data_out[WIDTH-1:1]};
    end
endmodule
