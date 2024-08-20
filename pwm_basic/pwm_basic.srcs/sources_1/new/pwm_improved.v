`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 13:49:13
// Design Name: 
// Module Name: pwm_improved
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
module pwm_improved #(parameter R = 8, TIMER_BITS = 15)(
    input wire clk,
    input wire reset_n,
    input wire [R : 0] duty,
    input wire [TIMER_BITS - 1: 0] FINAL_VALUE,
    output wire pwm_out
    );
    
    reg [R - 1: 0] Q_next, Q_reg;
    reg [R - 1: 0] D_next, D_reg;
    wire tick;
    
    always@(posedge clk, negedge reset_n)
        begin
        if(!reset_n) begin
            Q_reg <= 1'b0;
            D_reg <= 1'b0;
            end
        else if (tick) begin
            Q_reg <= Q_next;
            D_reg <= D_next;
            end
        end
        
    always@(*)
        begin
        Q_next = Q_reg + 1;
        D_next = (Q_reg < duty);
        end
        
    assign pwm_out = D_reg; 
         
    timer_input #(.BITS(TIMER_BITS))(
        .clk(clk),
        .reset_n(reset_n),
        .enable(1'b1),
        .FINAL_VALUE(FINAL_VALUE),
        .done(tick)
    );
    
endmodule
`default_nettype wire