`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 11:33:28
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
reg x;

wire y;

sequence_detector uut(
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    x = 0;

    #10 rst = 0;

    x=1; #10;
    x=0; #10;
    x=1; #10;
    x=1; #10;

    #20;

    $finish;
end

endmodule
