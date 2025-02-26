module sd1011_moore(
    input clk,
    input reset,
    input din,
    output reg dout,
);

  parameter [2:0]
  s0=3'b000,
  s1=3'b001,
  s2=3'b010,
  s3=3'b011,
  s4=3'b100;
  
  reg [1:0] state,next;
  
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        state<=s0;
      else
        state<=next;
    end
  
  always@(*)begin
    next=state;
    case(state)
      s0: next = din? s1 : s0;
      s1: next = din? s1 : s2;
      s2: next = din? s1 : s3;
      s3: next = din? s4 : s0;
      s4: next = din? s1 : s0;
      default: next = s0;
    endcase
  end
  
  always @(*)begin
    dout=(state==s4) ;
  end
endmodule
      
      
  
