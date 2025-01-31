module sr_flipflop(s,r,q,qb,clk,rst);
input s;
input r;
output reg q;
output  qb;
input clk;
input rst;

always@(posedge clk)
begin
	if(rst)
		q<=0;
	else
		case({s,r})
			2'b00: q<=q;
			2'b01: q<=1'b0;
			2'b10: q<=1'b1;
			2'b11: q<=1'bx;
		endcase
	end
assign  qb= ~q;
endmodule
