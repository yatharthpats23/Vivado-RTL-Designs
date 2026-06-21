`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 18:13:57
// Design Name: 
// Module Name: 4-bit alu
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
module alu_4bit(
    input [3:0] a,
    input [3:0] b,
    input [2:0] sel,
    output reg [3:0] y
    );

always @(*)
begin
    case(sel)

        3'b000: y = a + b;
        3'b001: y = a - b;
        3'b010: y = a & b;
        3'b011: y = a | b;
        3'b100: y = a ^ b;
        3'b101: y = ~a;
        3'b110: y = a << 1;
        3'b111: y = a >> 1;

        default: y = 4'b0000;

    endcase
end

endmodule
