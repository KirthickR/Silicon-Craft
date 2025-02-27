

module seqdete1101_moore_tb();
  reg clk;
  reg rst;
  reg in;
  wire dout;
  
 
  seqdetect_1101_moore dut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .dout(dout)
  );

 
  always #5 clk = ~clk;  

 
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars();
  end

 
  initial begin
    clk = 0;
    rst = 1; 
    in = 0;

    #10 rst = 0;  

   
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;  

    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;  

    #10 in = 1;
    #10 in = 0;
    #10 in = 1; 

    #50 $finish;  
  end


  initial begin
    $monitor("Time=%0t | clk=%b | rst=%b | in=%b | dout=%b", $time, clk, rst, in, dout);
  end
endmodule




# KERNEL: Time=0 | clk=0 | rst=1 | in=0 | dout=0
# KERNEL: Time=5 | clk=1 | rst=1 | in=0 | dout=0
# KERNEL: Time=10 | clk=0 | rst=0 | in=0 | dout=0
# KERNEL: Time=15 | clk=1 | rst=0 | in=0 | dout=0
# KERNEL: Time=20 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=25 | clk=1 | rst=0 | in=1 | dout=0
# KERNEL: Time=30 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=35 | clk=1 | rst=0 | in=1 | dout=0
# KERNEL: Time=40 | clk=0 | rst=0 | in=0 | dout=0
# KERNEL: Time=45 | clk=1 | rst=0 | in=0 | dout=0
# KERNEL: Time=50 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=55 | clk=1 | rst=0 | in=1 | dout=1
# KERNEL: Time=60 | clk=0 | rst=0 | in=1 | dout=1
# KERNEL: Time=65 | clk=1 | rst=0 | in=1 | dout=0
# KERNEL: Time=70 | clk=0 | rst=0 | in=0 | dout=0
# KERNEL: Time=75 | clk=1 | rst=0 | in=0 | dout=0
# KERNEL: Time=80 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=85 | clk=1 | rst=0 | in=1 | dout=1
# KERNEL: Time=90 | clk=0 | rst=0 | in=0 | dout=1
# KERNEL: Time=95 | clk=1 | rst=0 | in=0 | dout=0
# KERNEL: Time=100 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=105 | clk=1 | rst=0 | in=1 | dout=0
# KERNEL: Time=110 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=115 | clk=1 | rst=0 | in=1 | dout=0
# KERNEL: Time=120 | clk=0 | rst=0 | in=0 | dout=0
# KERNEL: Time=125 | clk=1 | rst=0 | in=0 | dout=0
# KERNEL: Time=130 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=135 | clk=1 | rst=0 | in=1 | dout=1
# KERNEL: Time=140 | clk=0 | rst=0 | in=1 | dout=1
# KERNEL: Time=145 | clk=1 | rst=0 | in=1 | dout=0
# KERNEL: Time=150 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=155 | clk=1 | rst=0 | in=1 | dout=0
# KERNEL: Time=160 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=165 | clk=1 | rst=0 | in=1 | dout=0
# KERNEL: Time=170 | clk=0 | rst=0 | in=1 | dout=0
# KERNEL: Time=175 | clk=1 | rst=0 | in=1 | dout=0
