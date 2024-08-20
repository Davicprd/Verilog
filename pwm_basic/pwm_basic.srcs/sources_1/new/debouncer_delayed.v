`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2024 15:21:02
// Design Name: 
// Module Name: debouncer_delayed
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
module debouncer_delayed(
    input wire clk,
    input wire reset_n,
    input wire noisy,
    output wire debounced
    );
    
    wire timer_done, timer_reset;
    localparam FINAL_VALUE = 1_999_9999, TIMER_BITS = 20;
    
    debouncer_delayed_FSM (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .timer_done(timer_done),
        .timer_reset(timer_reset),
        .debounced(debounced)
    );
    
    timer_input #(.BITS(TIMER_BITS))(
        .clk(clk),
        .reset_n(~timer_reset),
        .enable(~timer_reset),
        .FINAL_VALUE(FINAL_VALUE),
        .done(timer_done)
    );
    
    
endmodule
`default_nettype wire