module sipo(data_in,clk,data_out,rst);
input data_in;
input clk;
input s_in;
input rst;
output reg [3:0] data_out;


always@(posedge clk)
begin
	if(rst)
		data_out<=0;
	else 
	data_out[3]<=s_out[2];
	data_out[2]<=s_out[1];
	data_out[1]<=s_out[0];
	data_out[0]<=data_in;
end
endmodule
