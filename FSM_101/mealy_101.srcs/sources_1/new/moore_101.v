`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 16:05:02
// Design Name: 
// Module Name: moore_101
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


module moore_101(
    input clk,
    input reset_n,
    input x,
    output reg y
    );
    
    reg [1:0] state_reg, state_next;
    localparam s0 = 0;
    localparam s1 = 1;
    localparam s2 = 2;
    localparam s3 = 3;
    
    always@(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            state_reg <= s0;
            y <= s0;
            end
        else
            state_reg <= state_next;
        y <= {state_reg == s3};
            
        end
    
    always@(*) begin
        case(state_reg)
        
            s0 : if(x)
                    state_next = s1;
                 else
                    state_next = s0;
                    
            s1 : if(x)
                    state_next = s1;
                 else
                    state_next = s2;
                    
            s2 : if(x)
                    state_next = s3;
                 else
                    state_next = s0;
                       
            s3 : if(x)
                    state_next = s1;
                 else
                    state_next = s2;   
                    
            default: state_next = state_reg;     
            endcase
       end
    
endmodule

