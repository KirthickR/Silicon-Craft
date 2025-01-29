module fourbit_comparator_tb();
reg [0:3] A;
reg [0:3] B;
wire A_grt_B, A_eq_B, A_lst_B;

fourbit_comparator dut(.A(A),.B(B),.A_grt_B(A_grt_B),.A_eq_B(A_eq_B),.A_lst_B(A_lst_B));
initial 	
	begin
		$dumpfile("waves.vcd");
		$dumpvars();
	end
	initial 
		begin
			$monitor("A=%b,B=%b,A_grt_B=%b,A_eq_B=%b,A_lst_B=%b",A,B,A_grt_B,A_eq_B,A_lst_B);
			repeat(7) begin
				A=$random;
				B=$random;
				#15;
			end
		end
endmodule
