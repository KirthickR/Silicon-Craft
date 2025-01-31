// Code your testbench here
// or browse Examples
module jk_flipflop_tb();
  reg j,k;
  reg clk,rst;
  wire q;
  wire qb;
  
  jk_flipflop dut(.j(j),.k(k),.clk(clk),.rst(rst),.q(q),.qb(qb));
  
  initial 
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
    end
  
  initial 
    begin
  clk=0;
    forever #10 clk = ~clk;
      
    end
  
  initial
    begin
      
      j=1;k=1;rst=0; #15;
      j=1;k=0;rst=0; #15;
      j=0;k=1;rst=0; #15;
      j=0;k=0;rst=0; #15;
      j=0;k=1;rst=1; #15;
      $monitor(" j=%b, k=%b, clk=%b, rst=%b, q=%b, qb=%b",j,k,clk,rst,q,qb);
      $finish;
    end 
endmodule
