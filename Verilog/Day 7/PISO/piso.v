// Code your design here
module piso #(parameter WIDTH=4)(clr,clk,data_in,load,data_out);
  input [WIDTH-1:0] data_in;
  input load;
  input clr,clk;
  output reg data_out;
  
  reg [WIDTH-1:0] shift_reg;
  
  always@(posedge clk or posedge clr or load)
    begin
      if(clr)
        shift_reg<=0;
      else if(load)
  shift_reg=data_in;
      else
        shift_reg<={shift_reg[WIDTH-2:0],1'b0};
    end
  always@(*)
    begin
      data_out<=shift_reg[WIDTH-1];
    end
endmodule
