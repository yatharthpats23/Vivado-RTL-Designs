`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 16:58:57
// Design Name: 
// Module Name: universal_shift_register
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


module universal_shift_register(
    input clk,
    input rst,
    input [1:0] sel,
    input [3:0] din,
    output reg [3:0] q
);

always @(posedge clk)
begin
    if(rst)
        q <= 4'b0000;

    else
    begin
        case(sel)

            2'b00: q <= q;               // Hold

            2'b01: q <= {1'b0,q[3:1]};   // Shift Right

            2'b10: q <= {q[2:0],1'b0};   // Shift Left

            2'b11: q <= din;             // Parallel Load

        endcase
    end
end

endmodule
