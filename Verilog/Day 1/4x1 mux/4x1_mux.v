module fourtoone_mux(data_in,sel_in,y);
input [3:0] data_in;
input [1:0] sel_in;
output reg y;

always@(*)
	begin
	if(sel_in==2'b00)
		y=data_in[0];
	else if(sel_in==2'b01)
		y=data_in[1];

	else if(sel_in==2'b10)
		y=data_in[2];
	else
		y=data_in[3];


end
endmodule
