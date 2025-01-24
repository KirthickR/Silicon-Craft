module full_subtractor(a,b,bin,difference,borrow);
input a,b,bin;
output difference,borrow;
wire w1,w2,w3;

half_subtractor HS1(.a(a),.b(b),.difference(w1),.borrow(w2));
half_subtractor HS2(.a(w1),.b(bin),.difference(difference),.borrow(w3));
or OR1(borrow,w3,w2); 
endmodule
 
module half_subtractor(a,b,difference,borrow);
input a,b;
output difference,borrow;
assign difference=a^b;
assign borrow=~a&b;
endmodule
