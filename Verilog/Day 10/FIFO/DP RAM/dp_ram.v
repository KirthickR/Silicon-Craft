module dp_ram #(parameter WIDTH =8, DEPTH =8)
  (	input clk,
  	input we_a,we_b,
    input [DEPTH-1:0] addr_a, addr_b,
   	input [WIDTH-1:0] data_ina,data_inb,
   	output reg [WIDTH-1:0] data_outa,data_outb
  );
  
  reg [7:0] mem[0:7];
  
  always@(posedge clk)
    begin
      if(we_a)
        mem[addr_a]<=data_ina;
      else
        mem[addr_a]<=data_outa;
    end
      
      always@(posedge clk)
        begin
      if(we_b)
        mem[addr_b]<=data_inb;
          else
            mem[addr_b]<=data_outb;
    end
      endmodule
  
  /*assign data_outa =mem[addr_a];
  assign data_outb = mem[addr_b];
endmodule*/
   
  
