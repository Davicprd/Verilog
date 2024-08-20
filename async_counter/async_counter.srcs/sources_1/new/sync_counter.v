`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 14:36:31
// Design Name: 
// Module Name: sync_counter
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


module sync_counter(
    input clk,
    input reset_n,
    output [3:0] Q
    );
    
    wire Q0_next, Q1_next, Q2_next,Q3_next;
    
    assign Q0_next = 1'b1;
    T_FF F0(
        .clk(clk),
        .T(Q0_next),
        .reset_n(reset_n),
        .Q(Q[0])
    );
    assign Q1_next = Q0_next & Q[0];
    T_FF F1(
        .clk(clk),
        .T(Q1_next),
        .reset_n(reset_n),
        .Q(Q[1])
    );
    assign Q2_next = Q1_next & Q[1];
     T_FF F2(
        .clk(clk),
        .T(Q2_next),
        .reset_n(reset_n),
        .Q(Q[2])
    );
    assign Q3_next = Q2_next & Q[2];
     T_FF F3(
        .clk(clk),
        .T(Q3_next),
        .reset_n(reset_n),
        .Q(Q[3])
    );
    
endmodule

