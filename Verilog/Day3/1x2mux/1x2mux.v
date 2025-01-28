module onetotwo_mux (i0,i1,sel,y);
input y;
input sel;
output  reg i0,i1;
initial 
begin
if(sel==0)
	i0=y;
else
	i1=y;
end

endmodule
