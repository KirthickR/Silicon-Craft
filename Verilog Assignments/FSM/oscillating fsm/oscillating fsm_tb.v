// Code your testbench here
// or browse Examples
module oscillating_fsm_tb();
  
  reg clk;
  reg A;
  reg reset;
  wire [1:0] state;
  
  oscillating_fsm dut(.clk(clk),.A(A),.reset(reset),.state(state));
  
  initial
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
      $monitor("time=%0t, clk=%b, A=%b, reset=%b, state=%b",$time,clk,A,reset,state);
    end
  always #5 clk=~clk;
  initial begin
    clk=0;
    reset=1;
    
    clk=1;
    reset=0;
    A=2'b11; #10;
    A=2'b10; #10;
    
    #40 $finish;
  end
endmodule
    
