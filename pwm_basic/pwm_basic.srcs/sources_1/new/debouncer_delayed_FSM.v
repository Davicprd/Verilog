`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2024 14:57:51
// Design Name: 
// Module Name: debouncer_delayed_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`default_nettype none
module debouncer_delayed_FSM(
    input wire clk,
    input wire reset_n,
    input wire noisy,
    input wire timer_done,
    output wire timer_reset,
    output wire debounced
    );
    
        
    reg [1:0] state_reg, state_next;
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
    
    always@(posedge clk, negedge reset_n) begin
        if(!reset_n) 
            state_reg <= s0;  
        else
            state_reg <= state_next;          
        end
    
    always@(*) begin
    
        state_next = state_reg;
        
        case(state_reg)
            s0 : if(!noisy)
                    state_next = s0;
                 else
                    state_next = s1;
                    
            s1 : if(noisy && ~timer_done)
                    state_next = s1;
                 else if(!noisy)
                    state_next = s0;
                 else if(noisy && timer_done)
                    state_next = s2;
                    
            s2 : if(noisy)
                    state_next = s2;
                 else if(!noisy)
                    state_next = s3;
                       
            s3 : if(~noisy && ~timer_done)
                    state_next = s3;
                 else if (~noisy && timer_done)
                    state_next = s0;
                 else if(noisy)
                    state_next = s2;   
                    
            default: state_next = s0;   
            endcase
       end
       
     assign debounced = (state_reg == s2) | (state_reg == s3);
     assign timer_reset = (state_reg == s0) | (state_reg == s2);
    
endmodule
`default_nettype wire