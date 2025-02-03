// Code your design here
module pipo #(parameter WIDTH=4)(data_in,clk,rst,data_out);
  input [WIDTH-1:0] data_in;
  input clk,rst;
  output reg [WIDTH-1:0] data_out;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        data_out<=4'b0000;
      else
        data_out<=data_in;
        end
        endmodule
