module seqdetect_1101_moore (
    input clk,
    input rst,
    input in,
    output reg dout
);

  parameter [2:0] 
    S0 = 3'b000,
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100;  

  reg [2:0] state, next_state;  


  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= S0;
    else
      state <= next_state;
  end


  always @(*) begin
    if (state == S0) begin
      if (in)
        next_state = S1;
      else
        next_state = S0;
    end 
    else if (state == S1) begin
      if (in)
        next_state = S2;
      else
        next_state = S0;
    end 
    else if (state == S2) begin
      if (in)
        next_state = S2;
      else
        next_state = S3;
    end 
    else if (state == S3) begin
      if (in)
        next_state = S4;
      else
        next_state = S0;
    end 
    else if (state == S4) begin 
      next_state = S0;
    end 
    else begin
      next_state = S0; 
    end
  end


  always @(*) begin
    if (state == S4)
      dout = 1;
    else
      dout = 0;
  end

endmodule
