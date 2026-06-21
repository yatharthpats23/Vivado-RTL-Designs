`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 18:15:22
// Design Name: 
// Module Name: jk_ff
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

module jk_ff(
    input j,
    input k,
    input clk,
    output reg q,
    output qb
);

assign qb = ~q;

always @(posedge clk)
begin
    case ({j,k})
        2'b00: q <= q;    // Hold
        2'b01: q <= 1'b0; // Reset
        2'b10: q <= 1'b1; // Set
        2'b11: q <= ~q;   // Toggle
    endcase
end

endmodule
