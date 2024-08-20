`timescale 1ms / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2024 13:40:12
// Design Name: 
// Module Name: debouncer_delayed_tb
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


module debouncer_delayed_tb(
    );
    reg clk, reset_n, noisy;
    wire debounced;
    
    debouncer_delayed uut(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .debounced(debounced)
        );
        
    localparam T = 0.000005;
    always
         begin
         clk = 1'b0;
         #(T);
         clk = 1'b1;
         #(T);
         end
         
    initial 
        begin
        reset_n = 1'b0;
        #1;
        reset_n = 1'b1;
        noisy = 1'b1;
        #50;
        noisy = 1'b0;
        #50;
        noisy = 1'b1;
        #50;
        noisy = 1'b0;
        #50;
        noisy = 1'b1;
        #50;
        noisy = 1'b0;
        #50;
        noisy = 1'b1;
        #201;
        noisy = 1'b0;
        #50;
        noisy = 1'b1;
        #50;
        noisy = 1'b0;
        #50;
        noisy = 1'b1;
        #50;
        noisy = 1'b0;
        #50;
        noisy = 1'b1;
        #50;
        noisy = 1'b0;
        #201;       
        end
endmodule