module threetoone_mux_tb();
reg i0,i1,i2;
reg s0,s1;
wire y;

threetoone_mux dut(.i0(i0),.i1(i1),.i2(i2),.s0(s0),.s1(s1),.y(y));
initial 
	begin
	$dumpfile("waves.vcd");
	$dumpvars();
end
integer i,j,k;
initial 
	begin
	$monitor("i0=%b,i1=%b,i2=%b,s0=%b,s1=%b,y=%b",i0,i1,i2,s0,s1,y);

		for(i=0;i<2;i++)begin
			for(j=0;j<2;j++)begin
				for(k=0;k<2;k++)begin
i0=i [1:0];
i1=j [1:0];
i2=k [1:0];
#15;
s0=$random%2;
s1=$random%2;
#15;

end
	end
		end
		$finish;
			end	
endmodule
