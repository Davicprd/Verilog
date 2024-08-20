`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 15:33:55
// Design Name: 
// Module Name: teste_clock_tb
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


module teste_clock_tb(

    );
    reg clk_in;
    reg [1:0] change_clk;
    wire led;

    teste_clock uut(
        .clk_in(clk_in),
        .change_clk(change_clk),
        .led(led) 
      );
 
    initial 
    #12000000 $stop;
  
    always
    begin
        clk_in = 1'b0;
        #1;
        clk_in = 1'b1;
        #1;
    end
    
    initial 
        begin
        change_clk = 2'b00;
        #10000
        change_clk = 2'b01;
        #100000
        change_clk = 2'b10;
        #1000000
        change_clk = 2'b11;
        #10000000
        change_clk = 2'b00;
        #10000
        change_clk = 2'b01;
        end
endmodule
