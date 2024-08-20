`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 13:52:48
// Design Name: 
// Module Name: sseg_test
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


module sseg_test(
    input [3:0] dec,
    input [7:0] SW,
    input decimal_point,
    output DP,
    output [7:0] AN,
    output [6:0] sseg
    );
    
    assign AN = SW;
    assign DP = decimal_point;
    
    sseg_display B0(
        .dec(dec),
        .sseg(sseg)
        
     );
     
endmodule
