module fourbit_comparator(A,B,A_grt_B,A_eq_B,A_lst_B);
input [0:3] A;
input [0:3] B;
output reg A_grt_B;
output reg A_eq_B;
output reg A_lst_B;

always@(*)
	begin
	A_grt_B=0;A_eq_B=0;A_lst_B=0;
		if(A>B)
			A_grt_B=1'b1;
		else if(A<B)
			A_eq_B=1'b1;
		else 
			A_lst_B=1'b1;
	end


endmodule
