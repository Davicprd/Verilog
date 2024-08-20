`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 13:23:37
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(
    );
    
    parameter WIDTH = 4;
    reg clk, reset;
    reg enable, load, mode;
    reg [WIDTH - 1: 0] data_in;
    wire [6 : 0] sseg;
    
    counter uut(
        .enable(enable),
        .reset(reset),
        .load(load),
        .mode(mode),
        .clk(clk),
        .data_in(data_in),
        .sseg(sseg)
    );
    
    initial 
    #60000 $stop;
  
    always
    begin
        clk = 1'b0;
        #3;
        clk = 1'b1;
        #3;
    end
    
    initial
    begin
        data_in = 3'b111;
        enable = 1'b1;
        load = 1'b1;
        mode = 1'b1;
        reset = 1'b0;
        #12; 
        reset = 1'b1;
    end
endmodule
