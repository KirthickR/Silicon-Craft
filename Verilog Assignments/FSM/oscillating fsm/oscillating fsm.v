Given the conditions, such that If A = 0, the circuit oscillates between either one
of the two cases. Case 1: 00-01-00-01... and Case 2: 10-11-10-11... And If A =
1, it switches inter between two cases. write Verilog code.


module oscillating_fsm (
    input clk,    
    input reset,
    input A,      
    output reg [1:0] state  
);

    parameter [1:0] 
        S0 = 2'b00, 
        S1 = 2'b01,  
        S2 = 2'b10,  
        S3 = 2'b11;

reg current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;  
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            S0: next_state = (A) ? S2 : S1; 
            S1: next_state = (A) ? S3 : S0;
            S2: next_state = (A) ? S0 : S3;  
            S3: next_state = (A) ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        state = current_state;  
    end

endmodule
