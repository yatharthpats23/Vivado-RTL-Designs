`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 18:40:28
// Design Name: 
// Module Name: stimuli
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

module stimuli;

reg d;
reg clk;

wire q;

d_ff uut(
    .d(d),
    .clk(clk),
    .q(q)
);

initial
begin
    clk = 0;

    forever #5 clk = ~clk;
end

initial
begin
    d = 0;
    #10;

    d = 1;
    #10;

    d = 0;
    #10;

    d = 1;
    #10;

    $finish;
end

endmodule
