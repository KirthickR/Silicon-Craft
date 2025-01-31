module sr_latch(s,r,q,qb);
input s,r;
output reg q,qb;

always@(*)
begin
	case({s,r})
		2'b00: q<=0;  
		2'b01: begin q<=1'b0; qb<=1'b1; end
		2'b10: begin q<=1'b1; qb<=~1'b0; end
		2'b11: begin q<=1'bx; qb<=1'bx; end
	endcase
end
endmodule
