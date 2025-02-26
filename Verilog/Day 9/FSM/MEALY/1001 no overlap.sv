module sd1011_mealy(
    input clk,
    input reset,
    input din,
    output reg dout,
);

  parameter [1:0]
  s0=2'b00,
  s1=2'b01,
  s2=2'b10,
  s3=2'b11;
  
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
      s3: next = din? s0 : s0;
      default: next = s0;
    endcase
  end
  
  always @(*)begin
    dout=(state==s3) && (din==0);
  end
endmodule
      
      
  
