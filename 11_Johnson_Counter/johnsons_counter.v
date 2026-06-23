`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 11:08:11
// Design Name: 
// Module Name: johnsons_counter
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


module johnson_counter(
    input clk,
    input rst,
    output reg [3:0] q
);

always @(posedge clk)
begin
    if(rst)
        q <= 4'b0000;
    else
        q <= {q[2:0], ~q[3]};
end

endmodule
