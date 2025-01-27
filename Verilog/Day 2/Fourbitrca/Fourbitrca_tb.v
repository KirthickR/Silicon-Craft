module fourbit_rca_tb();
reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [3:0] Sum;
wire  Carry;

fourbit_rca dut(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Carry(Carry));
initial 
	begin
	$dumpfile("waves.vcd");
	$dumpvars();
end 

initial 
	begin
	A0=$random%16;
	A1=$random%16;
	A2=$random%16;
	A3=$random%16;

	B0=$random%16;
	B1=$random%16;
	B2=$random%16;
	B3=$random%16;
	
	Cin=$random%16;
	#10;
	$monitor("time=%b, A=%b, B=%b, Cin=%b, Sum=%b, Carry=%b",A,B,Cin,Sum,Carry);
end 
	endmodule
