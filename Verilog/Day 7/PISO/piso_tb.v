// Code your testbench here
// or browse Examples
module piso_tb();
  reg [3:0] data_in;
  reg load;
  reg clr;
  reg clk;
  wire data_out;
  
  piso dut(.data_in(data_in),.load(load), .clr(clr),.clk(clk),.data_out(p_out));
  
  initial 
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
    end
  
  initial 
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  
  initial
    begin
      $monitor("data_in=%b, load=%b, clr=%b, clk=%b, data_out=%b",data_in, load, clr,clk,p_out);
      clr=1; load=0; data_in=4'b1010; #10;
    clk=1;  clr=0; load=1; data_in=4'b1001; #10;
      clk=1;  clr=0; load=1; data_in=4'b0101; #10;
      load =0; #80;
      $finish;
    end
endmodule
