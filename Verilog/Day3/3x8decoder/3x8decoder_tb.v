module threetoeight_decoder_tb();
reg [0:2] data_in;
reg enable;
wire [0:7] data_out;

threetoeight_decoder dut(.data_in(data_in),.enable(enable),.data_out(data_out));
initial
	begin
		$dumpfile("waves.vcd");
		$dumpvars();
	end
initial
	begin
	$monitor("data_in=%b,enable=%b,data_out=%b",data_in,enable,data_out);
	repeat(6) begin
	enable=1'b1;
	data_in=$random; #15;

	end
		end

endmodule
