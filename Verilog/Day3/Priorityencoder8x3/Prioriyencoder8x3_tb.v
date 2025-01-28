module priority_encoder_tb();
reg [0:7] data_in;
wire [0:2] data_out;


priority_encoder dut(.data_in(data_in),.data_out(data_out));
initial
	begin
		$dumpfile("waves.vcd");
		$dumpvars();
	end
initial
	begin
	$monitor("data_in=%b,data_out=%0b",data_in,data_out);
	repeat(5) begin
		data_in=$random; #15;
	end
end	


endmodule
