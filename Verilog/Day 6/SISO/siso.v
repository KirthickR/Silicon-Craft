module siso(input clk, rst, data_in,
						output reg data_out);
reg [3:0]reg1;
				
always@(posedge clk)
begin
	if(rst)begin
		reg1 <= 0;
	end
	else
	begin
      reg1 <= {reg1[2:0], data_in};
      data_out <= reg1[3];
	end		
end
endmodule 
          
          
          
