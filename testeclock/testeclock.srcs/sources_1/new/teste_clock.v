`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 15:04:27
// Design Name: 
// Module Name: teste_clock
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


module teste_clock(
    input clk_in,
    input [1:0] change_clk,
    input rst,
    output led
    );
    reg [27:0] count = 0;
    reg clk_out = 0;
    
    always@(posedge clk_in) begin
        if(~rst) begin
            count <= 0;
            clk_out <= 0;
            end
        else begin
		count <= count + 1;    	     
        case(change_clk)
        
           2'b00 : if(count >= 50000000)
               begin
                    count <= 0;
                    clk_out <= ~clk_out;
               end
               else
               begin
                    clk_out <= clk_out;
               end          
               
           2'b01 : if(count >= 100000000)
               begin
                       count <= 0;
                       clk_out <= ~clk_out;
               end
               else
               begin
                    clk_out <= clk_out;
               end 
               
           2'b10 : if(count >= 200000000)
               begin
                       count <= 0;
                       clk_out <= ~clk_out;
               end
               else
               begin
                    clk_out <= clk_out;
               end 
               
           2'b11 : if(count >= 500000000)
               begin
                       count <= 0;
                       clk_out <= ~clk_out;
               end
               else
               begin
                    clk_out <= clk_out;
               end 
           default : clk_out <= clk_out;
        endcase
        end
    end        
        assign led = clk_out;
        
endmodule
