`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 17:37:16
// Design Name: 
// Module Name: stopwatch_display
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


module stopwatch_display #(
    parameter DIVIDER = 4
)(
    input clk,
    input reset,
    input start,
    output [6:0] seg
);

wire [3:0] count;

// Instantiate stopwatch
stopwatch #(
    .DIVIDER(DIVIDER)
) SW (
    .clk(clk),
    .reset(reset),
    .start(start),
    .count(count)
);

// Instantiate seven-segment driver
seven_segment SS (
    .digit(count),
    .seg(seg)
);

endmodule
