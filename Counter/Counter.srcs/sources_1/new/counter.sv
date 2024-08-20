`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 13:03:41
// Design Name: 
// Module Name: counter
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
module counter(

    input wire enable,
    input wire reset,
    input wire load,
    input wire mode,
    input wire clk,
    input wire [3:0]data_in,
    output reg [6:0] sseg,
    output wire [7:0] AN
    );
    
    reg [3 : 0] count;
    reg [26:0] count_clk;
    
   assign AN = 8'b11111110; 
   
   always@(posedge clk) begin
        if (!reset) begin
            count <= 4'b0;
            count_clk <= 27'b0;
            end
        else if(count_clk >= 100000000 && enable) begin
           count_clk <= 27'b0;
           if (load)
              count <= data_in;
           else if (mode == 1)
               count <= count + 1;
           else if (mode == 0)
                count <= count - 1;
   
           end
        else 
            count_clk <= count_clk + 1;
        end	           	  
 		  
   always@(count) begin
	       case(count)
	            0 : sseg = 7'b1000000;
                1 : sseg = 7'b1111001;
                2 : sseg = 7'b0100100;
                3 : sseg = 7'b0110000;
                4 : sseg = 7'b0011001;
                5 : sseg = 7'b0010010;
                6 : sseg = 7'b0000010;
                7 : sseg = 7'b1111000;
                8 : sseg = 7'b0000000;
                9 : sseg = 7'b0010000;
                default : sseg = 7'b00000110;
	       endcase
        end                    
endmodule
`default_nettype wire