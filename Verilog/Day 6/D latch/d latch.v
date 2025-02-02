module d_latch(d,enb,rst,q);
input d;
  input enb;
  input rst;
output reg q;

  always@(enb or rst or d)
	begin
      if(rst)
			q<=0;
		else if(enb)
			q<=d;
		else
			q<=0;
	end
endmodule
