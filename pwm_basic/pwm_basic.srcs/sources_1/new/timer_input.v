`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 13:54:16
// Design Name: 
// Module Name: timer_input
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
module timer_input #(parameter BITS = 4)(
    input wire clk,
    input wire reset_n,
    input wire enable,
    input wire [BITS - 1: 0 ]FINAL_VALUE,
    output wire done
    );
    
    reg [BITS - 1: 0 ] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
        begin
        if (!reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;
        end
        
    assign done = Q_reg == FINAL_VALUE;
    
    always @(*)
        Q_next = done? 'b0: Q_reg + 1;
    
endmodule
`default_nettype none