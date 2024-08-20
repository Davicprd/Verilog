`timescale 1ms / 1ns
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


module debouncer_delayed(
    input clk,
    input reset_n,
    input noisy,
    output debounced
    );
    
    wire timer_done, timer_reset;
    localparam FINAL_VALUE = 1_999_9999, TIMER_BITS = 27;
    
    debouncer_delayed_FSM D0 (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .timer_done(timer_done),
        .timer_reset(timer_reset),
        .debounced(debounced)
    );
    
    timer #(.BITS(TIMER_BITS)) T0 (
        .clk(clk),
        .reset_n(!timer_reset),
        .enable(!timer_reset),
        .FINAL_VALUE(FINAL_VALUE),
        .done(timer_done)
    );
    
    
endmodule
