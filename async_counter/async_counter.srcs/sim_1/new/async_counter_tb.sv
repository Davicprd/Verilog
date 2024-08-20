`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 15:07:36
// Design Name: 
// Module Name: async_counter_tb
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


module async_counter_tb(

    );
    
    reg clk,reset_n;
    wire [3:0] Q;
    
    async_counter uut(
    .clk(clk),
    .reset_n(reset_n),
    .Q(Q)
    );
    
    initial 
    #200 $stop;
    
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
   
    initial
    begin
            reset_n = 1'b0;
        #2  reset_n = 1'b1;
    end
    
endmodule
