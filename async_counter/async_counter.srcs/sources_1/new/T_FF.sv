`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 14:36:31
// Design Name: 
// Module Name: T_FF
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
module T_FF(
    input clk,
    input T,
    input reset_n,
    output Q
    );
    
    localparam C20_DELAY = 2;
    
    reg Q_reg;
    wire Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 1'b0;
        else
            #C20_DELAY Q_reg <= Q_next;
    end
    
    assign Q_next = T ? ~Q_reg: Q_reg;
    
    assign Q = Q_reg;
    
endmodule
    