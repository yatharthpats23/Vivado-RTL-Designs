`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 10:55:49
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

reg sclk;
reg rst;
reg cs;
reg mosi;

wire [7:0] rx_data;
wire done;

// Instantiate SPI Slave

spi_slave uut(

    .sclk(sclk),
    .rst(rst),
    .cs(cs),
    .mosi(mosi),
    .rx_data(rx_data),
    .done(done)

);

//--------------------------------------------------
// SPI Send Task
//--------------------------------------------------

task spi_send_byte;

input [7:0] data;
integer i;

begin

    for(i=7;i>=0;i=i-1)
    begin

        mosi = data[i];

        #5;
        sclk = 1;

        #5;
        sclk = 0;

    end

end

endtask

//--------------------------------------------------
// Test Sequence
//--------------------------------------------------

initial
begin

    sclk = 0;
    rst  = 1;
    cs   = 1;
    mosi = 0;

    //--------------------------
    // Reset
    //--------------------------

    #20;
    rst = 0;

    //--------------------------
    // First Transfer
    //--------------------------

    #20;

    cs = 0;

    spi_send_byte(8'b10110010);

    #10;
    cs = 1;

    #40;

    //--------------------------
    // Second Transfer
    //--------------------------

    cs = 0;

    spi_send_byte(8'b11001100);

    #10;
    cs = 1;

    #50;

    $finish;

end

endmodule