`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 17:54:09
// Design Name: 
// Module Name: 2bit_comparatorr
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

module comparator_2bit(
    input [1:0] a,
    input [1:0] b,
    output greater,
    output equal,
    output less
);

assign greater = (a > b);
assign equal   = (a == b);
assign less    = (a < b);

endmodule
