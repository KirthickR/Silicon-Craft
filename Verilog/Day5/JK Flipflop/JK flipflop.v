module jk_flipflop(j,k,clk,rst,q,qb);
  input  j,k;
  input clk,rst;
  output reg q;
 output qb;
  
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else if(j==0 && k==0)
         q<=0;
      else if(j==0 && k==1)
         q<=0;
      else if(j==1 && k==0)
         q<=1;
      else
         q<=~q;
    end
  assign qb=~q;
endmodule
