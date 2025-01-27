module fourbit_rca #(parameter SIZE = 4)(A,B,Cin,Sum,Carry);
input [SIZE-1:0] A;
input [SIZE-1:0] B;
input Cin;
output [SIZE-1:0] Sum;
output Carry;
wire  c1,c2,c3;

full_adder fa1(.a(A[0]),.b(B[0]),.cin(Cin),.sum(Sum[0]),.carry(c1));//first carry to 2nd
full_adder fa2(.a(A[1]),.b(B[1]),.cin(c1),.sum(Sum[1]),.carry(c2));//second carry to third
full_adder fa3(.a(A[2]),.b(B[2]),.cin(c2),.sum(Sum[2]),.carry(c3));//third carry to last one
full_adder fa4(.a(A[3]),.b(B[3]),.cin(c3),.sum(Sum[3]),.carry(Carry));

endmodule

module full_adder(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;


assign sum= a^b^cin;
assign carry=(a&b)|(b&cin)|(a&cin);
endmodule
