
module fifo_tb();
  
  parameter DEPTH = 64;
  parameter WIDTH = 8;
  
  reg clk;
  reg rst;
  reg wr_en;
  reg read_en;
  reg [WIDTH-1:0] buf_in;
  wire [WIDTH-1:0] buf_out;
  wire buff_full;
  wire buff_empty;
  wire [6:0] fifo_counter;
  
  
  fifo #(DEPTH, WIDTH) uut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .read_en(read_en),
    .buf_in(buf_in),
    .buf_out(buf_out),
    .buff_full(buff_full),
    .buff_empty(buff_empty),
    .fifo_counter(fifo_counter)
  );

  always #5 clk = ~clk; 
  
  initial
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
    end
 
  initial begin
    
    clk = 0;
    rst = 1;
    wr_en = 0;
    read_en = 0;
    buf_in = 0;

    #10 rst = 0; 
    
    $display("Writing to FIFO...");
    repeat (10) begin
      @(posedge clk);
      if (!buff_full) begin
        wr_en = 1;
        buf_in = buf_in + 1;
      end
    end
    wr_en = 0;

    
    $display("Reading from FIFO...");
    repeat (10) begin
      @(posedge clk);
      if (!buff_empty) begin
        read_en = 1;
      end
    end
    read_en = 0;

    
    #10;
    read_en = 1;
    #10;
    read_en = 0;

    
    $display("Filling FIFO completely...");
    repeat (DEPTH) begin
      @(posedge clk);
      if (!buff_full) begin
        wr_en = 1;
        buf_in = buf_in + 1;
      end
    end
    wr_en = 0;

    
    #10;
    wr_en = 1;
    #10;
    wr_en = 0;

    
    $display("Reading all data from FIFO...");
    repeat (DEPTH) begin
      @(posedge clk);
      if (!buff_empty) begin
        read_en = 1;
      end
    end
    read_en = 0;

    $display("Test completed.");
    $finish;
  end

  initial begin
    $monitor("time=%0t | Write=%b | Read=%b | buf_in=%h | buf_out=%h | buff_ull=%b | buff_empty=%b | Counter=%d", 
             $time, wr_en, read_en, buf_in, buf_out, buff_full, buff_empty, fifo_counter);
  end

endmodule
