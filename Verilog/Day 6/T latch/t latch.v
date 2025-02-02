// Code your design here
module t_latch(t,enb,rst,q);
input t;
  input enb;
  input rst;
output reg q;

  always@(t or rst or enb)
	begin
      if(rst)
         q <= 0;
      else begin
        if(enb)
        begin
        case(t)
		1'b0 : q<=q;
        1'b1 : q<=~q; 
        endcase
        end
        else
        q<=q;
      end
     
	end
endmodule
