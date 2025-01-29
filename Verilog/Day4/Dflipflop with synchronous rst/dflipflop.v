module d_ff(d,clk,rst,q);
input d;
input clk;
input rst;
output reg q;

always@(negedge clk)
	begin
		if(rst)
			q<=0;
		else
			q<=d;
	end
endmodule
