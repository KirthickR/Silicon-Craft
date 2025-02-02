module d_latch_tb();
reg d;
reg rst;
reg enb;
wire q;

d_latch dut(.d(d),.enb(enb),.rst(rst),.q(q));
initial 
	begin
		$dumpfile("waves.vcd");
		$dumpvars();
	end

initial
 	begin 
      $monitor("d=%b, enb=%b, rst=%b, q=%b",d,enb,rst,q);
		repeat (5) begin
			rst=1; #10;
			rst=0;
			enb=0; d=1;#10;
			enb=1;
			d=$random; 
	#15;
	end
	$finish;
	end
endmodule
