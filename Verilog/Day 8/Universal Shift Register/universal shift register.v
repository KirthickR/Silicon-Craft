module universal_shift #(parameter WIDTH=4)(data_in,clk,data_out,sel,shift_left,rst,shift_right);
  input [WIDTH-1:0] data_in;
  input clk;
  input [1:0] sel;
input rst;
input shift_right;
input shift_left;
  output reg [WIDTH-1:0] data_out;

always @(posedge clk or posedge rst)
begin
	if(rst)
		data_out<=4'b0000;
	else
	begin
		case(sel)
			2'b00: data_out<=data_out;
          2'b01: data_out<={shift_right,data_out[WIDTH -2:0]};
          2'b10: data_out<={data_out[WIDTH -1:1],shift_left};
			2'b11: data_out<=data_in;
			default: data_out<=data_out;
		endcase
	end
end
endmodule
