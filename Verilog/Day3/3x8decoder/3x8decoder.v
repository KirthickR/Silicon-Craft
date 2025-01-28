module threetoeight_decoder(data_in,data_out,enable);
input [0:2] data_in;
input enable;
output reg [0:7] data_out;

always@(*)
	begin
		if(enable)
			case(data_in)
				3'b000: data_out=8'b0000_0001;
				3'b001: data_out=8'b0000_0010;
				3'b010: data_out=8'b0000_0100;
				3'b011: data_out=8'b0000_1000;
				3'b100: data_out=8'b0001_0000;
				3'b101: data_out=8'b0010_0000;
				3'b110: data_out=8'b0100_0000;
				3'b111: data_out=8'b1000_0000;
				default: data_out=8'b0000_0000;
			endcase


			else begin
				data_out=8'b0000_0000;
			end
		end	

endmodule
