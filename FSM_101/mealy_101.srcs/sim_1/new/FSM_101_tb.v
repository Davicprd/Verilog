`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 15:24:57
// Design Name: 
// Module Name: mealy_101_tb
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


module mealy_101_tb(
    );
    
    reg clk, reset_n, x;
    wire y;
    
    mealy_101 uut(
        .clk(clk),
        .reset_n(reset_n),
        .x(x),
        .y(y)
    );
    
    localparam T = 10;
    
    initial 
        #80 $stop;
        
    always begin
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
        end
        
    initial begin
        reset_n = 1'b0;
        x = 1'b0;
        #2;
        reset_n = 1'b1;
        #2;
        x = 1'b1;
        #6;
        x = 1'b0;
        #11;
        x = 1'b1;
        #10;
        x = 1'b0;
        #10;
        x = 1'b1;
        #10;
        x = 1'b0;
        #10;
        x = 1'b0;
        #10;
        x = 1'b1;
        end
endmodule
