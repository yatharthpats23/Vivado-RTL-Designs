`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 11:31:39
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter(
    input clk,
    input rst,
    input up_down,
    output reg [3:0] q
    );

always @(posedge clk)
begin
    if(rst)
        q <= 4'b0000;

    else if(up_down)
        q <= q + 1;

    else
        q <= q - 1;
end

endmodule
