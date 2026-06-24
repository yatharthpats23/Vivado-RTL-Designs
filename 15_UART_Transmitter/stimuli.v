`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 18:54:48
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
reg start;
reg [7:0] data_in;

wire tx;

uart_tx uut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .tx(tx)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    start = 0;

    #10 rst = 0;

    data_in = 8'b10110010;

    #10 start = 1;
    #10 start = 0;

    #150;

    $finish;

end

endmodule
