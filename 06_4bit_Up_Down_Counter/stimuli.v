`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 11:35:26
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
reg up_down;

wire [3:0] q;

up_down_counter uut(
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .q(q)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    up_down = 1;

    #10 rst = 0;

    #50 up_down = 0;

    #50 $finish;
end

endmodule
