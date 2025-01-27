module threetoone_mux(i0,i1,i2,s0,s1,y);
input i0,i1,i2;
input s0,s1;
output reg y;
always@(*)
		begin
	case({s0,s1})
		2'b00: y=i0;
		2'b01: y=i1;
		2'b10: y=i2;
		2'b11: y=i2;
		default: y=1'b0;
	endcase

end
endmodule
