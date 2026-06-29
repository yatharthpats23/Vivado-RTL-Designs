`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 18:12:43
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


`timescale 1ns / 1ps

module stimuli;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;

wire mosi;
wire sclk;
wire cs;
wire done;

// Instantiate SPI Master

spi_master uut (

    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .mosi(mosi),
    .sclk(sclk),
    .cs(cs),
    .done(done)

);

//--------------------------------------------------
// Clock Generation (100 MHz)
//--------------------------------------------------

always #5 clk = ~clk;

//--------------------------------------------------
// Test Sequence
//--------------------------------------------------

initial
begin

    // Initialize Inputs

    clk = 0;
    rst = 1;
    start = 0;
    data_in = 8'b10110010;

    //--------------------------------------------------
    // Apply Reset
    //--------------------------------------------------

    #20;
    rst = 0;

    //--------------------------------------------------
    // Start First Transmission
    //--------------------------------------------------

    #20;
    start = 1;

    #10;
    start = 0;

    //--------------------------------------------------
    // Wait until transmission completes
    //--------------------------------------------------

    wait(done);

    #20;

    //--------------------------------------------------
    // Send Another Byte
    //--------------------------------------------------

    data_in = 8'b11001100;

    start = 1;

    #10;
    start = 0;

    wait(done);

    #50;

    $finish;

end

endmodule
