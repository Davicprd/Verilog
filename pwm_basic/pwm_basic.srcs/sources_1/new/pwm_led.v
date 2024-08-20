`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 15:01:51
// Design Name: 
// Module Name: pwm_led
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
module pwm_led #(parameter R = 8)(
    input wire clk,
    input wire reset_n,
    input wire BTNU,BTND,
    output wire led
    );
    
    reg [R:0] duty;
    wire UP_B, DOWN_B;
    wire UP, DOWN;
    reg [1 : 0] SW = 2'b00;
    localparam TIMER_BITS = 16;
    localparam FINAL_VALUE = 19522;
    
    always@(posedge clk, negedge reset_n)
        begin
        if(~reset_n)
            SW = 2'b00;
        else if(UP && (SW != 2'b11))
            SW = SW + 1'b1;
        else if(DOWN && (SW != 2'b00))
            SW = SW - 1'b1;
        end
        
    always@(*) begin
          
        case(SW)
            2'b00 : duty = (0.25 * (2**R));
            2'b01 : duty = (0.50 * (2**R));
            2'b10 : duty = (0.75 * (2**R));
            2'b11 : duty = (1 * (2**R));
            default : duty = (0.25 * (2**R));
            
            endcase
        end 
     
        
    pwm_improved #(.TIMER_BITS(TIMER_BITS),.R(R))(
        .clk(clk),
        .reset_n(reset_n),
        .duty(duty),
        .FINAL_VALUE(FINAL_VALUE),
        .pwm_out(led)
    );
    
    debouncer_delayed (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(BTNU),
        .debounced(UP_B)
    );
    
    debouncer_delayed (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(BTND),
        .debounced(DOWN_B)
    );
    
   edge_detector (
        .clk(clk),
        .reset_n(reset_n),
        .level(UP_B),
        .p_edge(UP)
   );
   
    edge_detector (
        .clk(clk),
        .reset_n(reset_n),
        .level(DOWN_B),
        .p_edge(DOWN)
   );
    
endmodule
`default_nettype wire