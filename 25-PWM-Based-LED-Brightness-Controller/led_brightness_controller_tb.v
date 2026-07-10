`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 11:42:55
// Design Name: 
// Module Name: led_brightness_controller_tb
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

module led_brightness_controller_tb;

    reg clk;
    reg reset;
    reg [1:0] brightness_level;

    wire led;


    // Instantiate DUT
    led_brightness_controller DUT (
        .clk(clk),
        .reset(reset),
        .brightness_level(brightness_level),
        .led(led)
    );


    // Clock generation
    always #5 clk = ~clk;


    // Test sequence
    initial begin

        clk = 0;
        reset = 1;
        brightness_level = 2'b00;

        // Apply reset
        #20;
        reset = 0;


        // LED OFF - 0% duty cycle
        brightness_level = 2'b00;
        #80;


        // DIM - 25% duty cycle
        brightness_level = 2'b01;
        #80;


        // MEDIUM - 50% duty cycle
        brightness_level = 2'b10;
        #80;


        // BRIGHT - 75% duty cycle
        brightness_level = 2'b11;
        #80;


        $finish;

    end

endmodule