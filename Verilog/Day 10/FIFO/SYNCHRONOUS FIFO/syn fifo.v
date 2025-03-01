module fifo #(parameter DEPTH=64, WIDTH=8)(
    input clk, 
    input rst, 
    input wr_en, 
    input read_en, 
    input [WIDTH-1:0] buf_in,
    output reg [WIDTH-1:0] buf_out,
    output reg buff_full, 
    output reg buff_empty,
    output reg [6:0] fifo_counter
);
  
  reg [3:0] rd_ptr, wr_ptr;
  reg [WIDTH-1:0] bef_mem[DEPTH-1:0];

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      fifo_counter <= 0;
    end else begin
      if (wr_en && !buff_full && read_en && !buff_empty)
        fifo_counter <= fifo_counter; 
      else if (wr_en && !buff_full)
        fifo_counter <= fifo_counter + 1;
      else if (read_en && !buff_empty)
        fifo_counter <= fifo_counter - 1;
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      buff_empty <= 1;
      buff_full  <= 0;
    end else begin
      buff_empty <= (fifo_counter == 0);
      buff_full  <= (fifo_counter == DEPTH);
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst)
      buf_out <= 0;
    else if (read_en && !buff_empty)
      buf_out <= bef_mem[rd_ptr];
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      wr_ptr <= 0;
      rd_ptr <= 0;
    end else begin
      if (wr_en && !buff_full) begin
        bef_mem[wr_ptr] <= buf_in;
        wr_ptr <= wr_ptr + 1;
      end
      if (read_en && !buff_empty)
        rd_ptr <= rd_ptr + 1;
    end
  end
  
endmodule
