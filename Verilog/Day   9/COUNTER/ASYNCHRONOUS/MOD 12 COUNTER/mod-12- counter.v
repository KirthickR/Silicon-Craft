module modtwelve_counter #(parameter N=4)(
  input in,
  input clk,
  input rst,
  output reg [N-1:0] out);
  
  always@(negedge clk or posedge rst)
    begin
    if(rst)
      out<=4'b0000;
    else if(out<4'b1100)
      out<=out+1;
    else 
      out<=0;
  end
endmodule
  
