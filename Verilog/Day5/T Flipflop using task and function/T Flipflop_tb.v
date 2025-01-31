module t_flipflop_tb();
  reg t;
  reg clk,rst;
  wire q;
  wire qb;
  
  t_flipflop dut(.t(t),.clk(clk),.rst(rst),.q(q),.qb(qb));
  
  task drive;
    input bi;
    begin
      t=bi;
      #10;
    end
  endtask
  
  initial
    begin
      clk=0;
      forever #5 clk = ~clk;
    end
  
  initial 
    begin
      $dumpfile("waves.vcd");
      $dumpvars();

  rst=0; 
  drive(0);
  drive(1);
  drive(1);
  drive(0);
  drive(1);
  drive(0);
     $finish;
  end
endmodule
  
  
    
