module tb_dp_ram();
  
    parameter WIDTH = 8;
    parameter DEPTH = 8;
    parameter ADDR_WIDTH = (DEPTH);

    reg clk;
    reg we_a, we_b;
    reg [ADDR_WIDTH-1:0] addr_a, addr_b;
    reg [WIDTH-1:0] data_ina, data_inb;
    wire [WIDTH-1:0] data_outa, data_outb;

    dp_ram #(WIDTH, DEPTH) dut (
        .clk(clk),
        .we_a(we_a),
        .we_b(we_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_ina(data_ina),
        .data_inb(data_inb),
        .data_outa(data_outa),
        .data_outb(data_outb)
    );
  
  initial
    begin
      $dumpfile("waves.vcd");
      $dumpvars();
      $monitor("time=%0t, clk=%b, we_a=%b, we_b=%b, data_ina=%h, data_inb=%h, addr_a=%h, addr_b=%h, data_outa=%h, data_outb=%h", $time,clk,we_a, we_b, data_ina, data_inb, addr_a, addr_b, data_outa, data_outb);
    end
    always #5 clk = ~clk;  
    initial 
      begin

      clk = 0;we_a = 0; we_b = 0; data_ina = 0; data_inb = 0;
      addr_a = 0; addr_b = 0; 
    
         we_a = 1; addr_a = 3; data_ina = 8'hA5; #10;
         we_a = 1; addr_a = 2; data_ina = 8'hA5; #10;
         we_a =0;
        
          we_b = 1; addr_b = 5; data_inb = 8'h5A; #10;
          we_b = 1; addr_b = 6; data_inb = 8'hA5; #10;
         we_b = 0; 
         #10;
        
         addr_a = 3; 
         addr_a = 2;  
         addr_b = 5;  
         addr_b = 6;  
        #40 $finish;
         
//         $monitor("time=%0t, clk=%b, we_a=%b, we_b=%b, data_ina=%h, data_inb=%h, addr_a=%h, addr_b=%h, data_outa=%h, data_outb=%h", $time,clk,we_a, we_b, data_ina, data_inb, addr_a, addr_b, data_outa, data_outb);
         #100 $finish;
    end
endmodule
