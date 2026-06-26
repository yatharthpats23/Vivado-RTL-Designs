`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 12:29:47
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
reg rx;

wire [7:0] data_out;
wire done;

uart_rx uut(
    .clk(clk),
    .rst(rst),
    .rx(rx),
    .data_out(data_out),
    .done(done)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    rx = 1;

    #10 rst = 0;

    // Start bit
    #10 rx = 0;

    // Data = 10110010 (LSB first)
    #10 rx = 0;
    #10 rx = 1;
    #10 rx = 0;
    #10 rx = 0;
    #10 rx = 1;
    #10 rx = 1;
    #10 rx = 0;
    #10 rx = 1;

    // Stop bit
    #10 rx = 1;

    #20;

    $finish;
end

endmodule
