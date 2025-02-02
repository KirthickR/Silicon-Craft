// Code your testbench here
// or browse Examples
module t_latch_tb();
reg t;
reg enb;
  reg rst;
wire q;

  t_latch dut(.t(t),.enb(enb),.rst(rst),.q(q));
initial 
	begin
		$dumpfile("waves.vcd");
      $dumpvars();
	end

initial
 	begin 
      $monitor("t=%b, enb=%b, rst=%b, q=%b",t,enb,rst,q);
			
      		rst=1;enb = 0; #10;
   		rst=0; enb=1; t=0; #5;
      	 t=1; #5;
         t=0; #5;
		 t=1; #5;
         t=0; #5;
		 t=1; #5;
         t=0; #5;
		 t=1; #5;
         t=0; #5;
		 t=1; #5;
      $finish;
	end
endmodule
