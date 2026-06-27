`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 12:00:33
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
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

// Instantiate FIFO

fifo uut(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock Generation

always #5 clk = ~clk;

initial
begin

    // Initialization

    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    //-------------------------
    // Reset
    //-------------------------

    #10;
    rst = 0;

    //-------------------------
    // Write 8 Values
    //-------------------------

    wr_en = 1;

    data_in = 8'd10; #10;
    data_in = 8'd20; #10;
    data_in = 8'd30; #10;
    data_in = 8'd40; #10;
    data_in = 8'd50; #10;
    data_in = 8'd60; #10;
    data_in = 8'd70; #10;
    data_in = 8'd80; #10;

    wr_en = 0;

    //-------------------------
    // FIFO should become FULL
    //-------------------------

    #20;

    //-------------------------
    // Read 4 Values
    //-------------------------

    rd_en = 1;

    #40;

    rd_en = 0;

    //-------------------------
    // Simultaneous Read & Write
    //-------------------------

    #20;

    wr_en = 1;
    rd_en = 1;

    data_in = 8'd90; #10;
    data_in = 8'd100; #10;

    wr_en = 0;
    rd_en = 0;

    //-------------------------
    // Read Remaining Data
    //-------------------------

    #20;

    rd_en = 1;

    #80;

    rd_en = 0;

    //-------------------------
    // End Simulation
    //-------------------------

    #20;

    $finish;

end

endmodule
