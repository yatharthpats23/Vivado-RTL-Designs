`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 17:02:35
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

reg clk;
reg rst;
reg [1:0] sel;
reg [3:0] din;

wire [3:0] q;

universal_shift_register uut(
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .din(din),
    .q(q)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    sel = 2'b00;
    din = 4'b0000;

    #10 rst = 0;

    // Parallel Load
    sel = 2'b11;
    din = 4'b1010;
    #10;

    // Shift Left
    sel = 2'b10;
    #20;

    // Shift Right
    sel = 2'b01;
    #20;

    // Hold
    sel = 2'b00;
    #20;

    $finish;
end

endmodule
