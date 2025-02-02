module sipo_tb();
reg  clk, rst;
reg  data_in;
wire [3:0] data_out;

sipo uut( .clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out));

initial begin
	forever
	begin
		#5 clk =~clk;
	end
end



initial begin
	$monitor("%0t rst = %b data_in = %b , data_out =%b clk=%b", $time, rst, data_in, data_out,clk);
	$dumpfile("dump.vcd");
	$dumpvars;

end

initial begin
	clk = 0;
       	rst = 1;
       	data_in = 0;
end

initial begin
	#15 rst = 0;

        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;
     	#50 $finish;
end
endmodule
