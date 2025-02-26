module sync_updown_counter_tb();
    reg j, k, clk, rst_n, s;
    wire [3:0] q, qbar;

    sync_updown_counter uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst_n(rst_n),
        .s(s),
        .q(q),
        .qbar(qbar)
    );

    always #5 clk = ~clk;  

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
      $monitor("time: %0t | clk=%b | rst_n=%b | s=%b | j=%b | k=%b | q=%d", $time, clk, rst_n, s, j, k, q);
    end
endmodule

  # KERNEL: time: 0 | clk=0 | rst_n=0 | s=1 | j=x | k=x | q= 0
# KERNEL: time: 4 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q= 0
# KERNEL: time: 5 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q=15
# KERNEL: time: 10 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q=15
# KERNEL: time: 15 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q=14
# KERNEL: time: 20 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q=14
# KERNEL: time: 25 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q=13
# KERNEL: time: 30 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q=13
# KERNEL: time: 35 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q= 8
# KERNEL: time: 40 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q= 8
# KERNEL: time: 44 | clk=0 | rst_n=1 | s=0 | j=1 | k=1 | q= 8
# KERNEL: time: 45 | clk=1 | rst_n=1 | s=0 | j=1 | k=1 | q= 9
# KERNEL: time: 50 | clk=0 | rst_n=1 | s=0 | j=1 | k=1 | q= 9
# KERNEL: time: 55 | clk=1 | rst_n=1 | s=0 | j=1 | k=1 | q=10
# KERNEL: time: 60 | clk=0 | rst_n=1 | s=0 | j=1 | k=1 | q=10
# KERNEL: time: 65 | clk=1 | rst_n=1 | s=0 | j=1 | k=1 | q=15
# KERNEL: time: 70 | clk=0 | rst_n=1 | s=0 | j=1 | k=1 | q=15
# KERNEL: time: 75 | clk=1 | rst_n=1 | s=0 | j=1 | k=1 | q= 0
# KERNEL: time: 80 | clk=0 | rst_n=1 | s=0 | j=1 | k=1 | q= 0
# KERNEL: time: 84 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q= 0
# KERNEL: time: 85 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q=15
# KERNEL: time: 90 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q=15
# KERNEL: time: 95 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q=14
# KERNEL: time: 100 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q=14
# KERNEL: time: 105 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q=13
# KERNEL: time: 110 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q=13
# KERNEL: time: 115 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q= 8
# KERNEL: time: 120 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q= 8
# KERNEL: time: 125 | clk=1 | rst_n=1 | s=1 | j=1 | k=1 | q= 7
# KERNEL: time: 130 | clk=0 | rst_n=1 | s=1 | j=1 | k=1 | q= 7
