
module tb_1011_mealy();


  reg clk;
  reg reset;
  reg din;
  wire dout;


  sd1011_mealy dut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(dout)
  );
initial begin 
  clk=0;
   forever #5 clk = ~clk;
end

  initial
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
    end

  initial begin
    
    clk = 0;
    reset = 1; 
    din = 0;
    
     reset = 0; 
    
   
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    
    #100 $finish; 
  end

  initial begin
    $monitor(" Reset = %b | din = %b | dout = %b",reset, din, dout);
  end

endmodule


# KERNEL:  Reset = 0 | din = 0 | dout = x
# KERNEL:  Reset = 0 | din = 0 | dout = 0
# KERNEL:  Reset = 0 | din = 1 | dout = 0
# KERNEL:  Reset = 0 | din = 0 | dout = 0
# KERNEL:  Reset = 0 | din = 0 | dout = 1
# KERNEL:  Reset = 0 | din = 1 | dout = 0
# KERNEL:  Reset = 0 | din = 0 | dout = 0
# KERNEL:  Reset = 0 | din = 1 | dout = 0
# KERNEL:  Reset = 0 | din = 0 | dout = 0
# KERNEL:  Reset = 0 | din = 0 | dout = 1
# KERNEL:  Reset = 0 | din = 1 | dout = 0
