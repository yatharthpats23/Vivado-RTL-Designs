`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 18:10:30
// Design Name: 
// Module Name: seven_segment_driver_tb
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

module seven_segment_driver_tb;

    // Input
    reg [3:0] digit;

    // Output
    wire [6:0] seg;

    // Instantiate DUT
    seven_segment_driver uut
    (
        .digit(digit),
        .seg(seg)
    );

    // Test all inputs
    initial
    begin

        digit = 4'd0;
        #10;

        digit = 4'd1;
        #10;

        digit = 4'd2;
        #10;

        digit = 4'd3;
        #10;

        digit = 4'd4;
        #10;

        digit = 4'd5;
        #10;

        digit = 4'd6;
        #10;

        digit = 4'd7;
        #10;

        digit = 4'd8;
        #10;

        digit = 4'd9;
        #10;

        // Invalid input
        digit = 4'd10;
        #10;

        $finish;

    end

endmodule
