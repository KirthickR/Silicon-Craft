module johnson_counter(clk,clr, out);
  input clk;
    input clr;
  output reg [3:0] out;

  always @(negedge clr or posedge clk) begin
    if (!clr) begin
      out <= 4'b0000;  
      
    end else begin
      out <= {out[2:0], ~out[3]};  
    end
  end
endmodule
