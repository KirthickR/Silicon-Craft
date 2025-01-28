module priority_encoder(data_in,data_out);
input [0:7] data_in;
output reg [0:2] data_out;
always@(*)
begin
	casex(data_in)
		8'b0000_0001: data_out=3'b000;
		8'b0000_001x: data_out=3'b001;
		8'b0000_01xx: data_out=3'b010;
		8'b0000_1xxx: data_out=3'b011;
		8'b0001_xxxx: data_out=3'b100;
		8'b001x_xxxx: data_out=3'b101;
		8'b01xx_xxxx: data_out=3'b110;
		8'b1xxx_xxxx: data_out=3'b111;
		default: data_out= 3'b000;
	endcase
end






endmodule
