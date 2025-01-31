module sr_latch_tb();
reg s,r;
wire q,qb;

sr_latch dut(.s(s),.r(r),.q(q),.qb(qb));

task apply_input;
	input [1:0] bi;
	begin
	{s,r}=bi;
	#10;
end
endtask

initial 
	begin
	$dumpfile("waves.vcd");
	$dumpvars();

	apply_input(2'b00); #10;
	apply_input(2'b01); #10;
	apply_input(2'b10); #10;
	apply_input(2'b11); #10;
	$finish;
end

endmodule
