module async_updown_counter_tb();
    reg j, k, clk, rst_n, s;
    wire [3:0] q, qbar;

    async_updown_counter uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst_n(rst_n),
        .s(s),
        .q(q),
        .qbar(qbar)
    );

    always #5 clk = ~clk;  // Generate clock with 10 time units period

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars();

        
        clk = 0;   
        rst_n = 0;  
        s = 1;  
        
        #4 rst_n = 1; j = 1; k = 1;  
        
        #40 s = 0;  
        #40 s = 1; 
        #50 $finish;
    end

    initial begin
      $monitor("time: %0t | clk=%b | rst_n=%b | s=%b | j=%b | k=%b | q=%b", $time, clk, rst_n, s, j, k, q);
    end
endmodule

  
