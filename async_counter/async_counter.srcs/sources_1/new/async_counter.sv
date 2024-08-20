`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 14:36:31
// Design Name: 
// Module Name: async_counter
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


module async_counter(
    input clk,
    input reset_n,
    output [3:0] Q
    );
    
    T_FF F0(
        .clk(clk),
        .T(1'b1),
        .reset_n(reset_n),
        .Q(Q[0])
    );

    T_FF F1(
        .clk(~Q[0]),
        .T(1'b1),
        .reset_n(reset_n),
        .Q(Q[1])
    );
    
     T_FF F2(
        .clk(~Q[1]),
        .T(1'b1),
        .reset_n(reset_n),
        .Q(Q[2])
    );
 
     T_FF F3(
        .clk(~Q[2]),
        .T(1'b1),
        .reset_n(reset_n),
        .Q(Q[3])
    );
    
endmodule
