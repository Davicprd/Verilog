`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 13:36:18
// Design Name: 
// Module Name: sseg_display
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


module sseg_display(
    input [3:0] dec,
    output reg [6:0] sseg
    );
    always @(dec) //gfedcba
        case(dec)
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
            default : sseg = 7'b1000000;
        endcase
endmodule
