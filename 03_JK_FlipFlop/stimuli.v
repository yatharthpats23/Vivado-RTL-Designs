`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 18:18:23
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


`timescale 1ns/1ps

module jk_ff_tb;

reg j;
reg k;
reg clk;

wire q;
wire qb;

jk_ff uut(
    .j(j),
    .k(k),
    .clk(clk),
    .q(q),
    .qb(qb)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;

    // Hold
    j = 0; k = 0;
    #10;

    // Reset
    j = 0; k = 1;
    #10;

    // Set
    j = 1; k = 0;
    #10;

    // Toggle
    j = 1; k = 1;
    #20;

    $finish;
end

endmodule
