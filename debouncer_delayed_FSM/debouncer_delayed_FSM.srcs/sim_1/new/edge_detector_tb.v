`timescale 1ms / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2024 14:11:13
// Design Name: 
// Module Name: edge_detector_tb
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


module edge_detector_tb(

    );
    
    reg clk, reset_n, level;
    wire p_edge, n_edge, _edge;
    
    edge_detector uut(
        .clk(clk),
        .reset_n(reset_n),
        .level(level),
        .p_edge(p_edge),
        .n_edge(n_edge),
        ._edge(_edge)
        );
        localparam T = 0.5;
        
    always
        begin
        clk = 1'b0;
        #T;
        clk = 1'b1;
        #T;
        end
        
    initial
        begin
        reset_n = 1'b0;
        #1;
        reset_n = 1'b1;
        level = 1'b1;
        #10;
        level = 1'b0;
        #10;
        level = 1'b1;
        #10;
        level = 1'b0;
        #10;
        end
        
        
    
endmodule
