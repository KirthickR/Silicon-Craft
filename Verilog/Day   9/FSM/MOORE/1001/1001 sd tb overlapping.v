

module tb_sd1011_moore();


  reg clk;
  reg reset;
  reg din;
  wire dout;


  sd1011_moore dut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(dout)
  );
initial begin 
  clk=0;
   forever #12 clk = ~clk;
end

  initial
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
    end

  initial begin
    
    clk = 0;
    #6reset = 1; 
    din = 0;
    
     reset = 0; 
    
   
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    
    #10 din = 1;
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    
    #100 $finish; 
  end

  initial begin
    $monitor(" time = %t|Reset = %b | din = %b | dout = %b",$time,reset, din, dout);
  end

endmodule
