`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 17:44:23
// Design Name: 
// Module Name: stopwatch_display_tb
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

`timescale 1ns / 1ps

module stopwatch_display_tb;

reg clk;
reg reset;
reg start;

wire [6:0] seg;

// Instantiate DUT with small divider for simulation
stopwatch_display #(
    .DIVIDER(4)
) DUT (
    .clk(clk),
    .reset(reset),
    .start(start),
    .seg(seg)
);

// Clock generation
always #5 clk = ~clk;

// Test sequence
initial begin

    clk = 0;
    reset = 1;
    start = 0;

    #20;

    reset = 0;
    start = 1;

    #200;

    start = 0;

    #50;

    $finish;

end

endmodule
