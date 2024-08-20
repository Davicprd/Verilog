`timescale 1ms / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 14:53:03
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
    input clk,
    input reset_n,
    input level,
    output p_edge,
    output n_edge,
    output _edge
    );
    
     reg [1:0] state_reg, state_next;
    parameter s0 = 0, s1 = 1;
    
    always@(posedge clk, negedge reset_n) begin
        if(!reset_n) 
            state_reg <= s0;  
        else
            state_reg <= state_next;          
        end
    
    always@(*) begin
    
        state_next = state_reg;
        
        case(state_reg)
            s0 : if(level)
                    state_next = s1;
                 else
                    state_next = s0;
            s1 : if(level)
                    state_next = s1;
                 else
                    state_next = s0;
            default : state_next = s0;  
            endcase
        end
     assign p_edge = (state_reg == s0) && level;
     assign n_edge = (state_reg == s1) && ~level;
     assign _edge = p_edge | n_edge;
          
endmodule
