module seqdetect_1101_mealy (
    input clk,
    input rst,
    input in,
    output reg dout
);

  parameter [1:0] 
    S0 = 2'b00,
    S1 = 2'b01,
    S2 = 2'b10,
    S3 = 2'b11;

  reg [1:0] state, next_state;


  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= S0;
    else
      state <= next_state;
  end

  // Combinational Logic: Next State Logic using if-else
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
        next_state = S0;
      else
        next_state = S0;
    end 
    else begin
      next_state = S0; 
    end
  end

  
  always @(*) begin
    dout = (state == S3) && (in == 0);
  end

endmodule
