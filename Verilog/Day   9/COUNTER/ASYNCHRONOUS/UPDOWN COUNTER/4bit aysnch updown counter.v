// Code your design here
module jk_ff(j,k,rst_n,clk,q,qbar);
  input j,k;
  input rst_n;
  input clk;
  output reg q;
  output reg qbar;
  
 always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      q <= 1'b0;
    else begin
      case ({j, k})
        2'b00: q <= q;      
        2'b01: q <= 1'b0;   
        2'b10: q <= 1'b1;   
        2'b11: q <= ~q;     
      endcase
    end
  end

  assign qbar = ~q;
endmodule
      
module mux_updown_selector(
    input q, qbar, s,
    output reg clock
);

  always @(*) begin
    case (s)
      1'b0: clock = q;   
      1'b1: clock = qbar; 
    endcase
  end
endmodule

module async_updown_counter(
    input j, k, clk, rst_n, s,
    output [3:0] q, qbar
);

  wire [3:0] clock;

  jk_ff ff0(j, k, rst_n, clk, q[0], qbar[0]);
  
  mux_updown_selector ms0(q[0], qbar[0], s, clock[0]);
  jk_ff ff1(j, k, rst_n, clock[0], q[1], qbar[1]);

  mux_updown_selector ms1(q[1], qbar[1], s, clock[1]);
  jk_ff ff2(j, k, rst_n, clock[1], q[2], qbar[2]);

  mux_updown_selector ms2(q[2], qbar[2], s, clock[2]);
  jk_ff ff3(j, k, rst_n, clock[2], q[3], qbar[3]);

endmodule
