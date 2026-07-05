`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 17:37:16
// Design Name: 
// Module Name: stopwatch
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

module stopwatch #(
    parameter DIVIDER = 4
)(
    input clk,
    input reset,
    input start,
    output reg [3:0] count
);

reg [31:0] clk_count;

always @(posedge clk) begin

    if (reset) begin
        clk_count <= 0;
        count <= 0;
    end

    else if (start) begin

        if (clk_count == DIVIDER - 1) begin
            clk_count <= 0;

            if (count == 9)
                count <= 0;
            else
                count <= count + 1;
        end

        else begin
            clk_count <= clk_count + 1;
        end

    end

end

endmodule
