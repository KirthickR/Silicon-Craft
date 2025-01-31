module t_flipflop(t,clk,rst,q,qb);
  input t;
  input clk,rst;
  output reg q;
  output qb;
  
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else
        q<=(t?q:~q);
    end
  assign qb=~q;
endmodule
