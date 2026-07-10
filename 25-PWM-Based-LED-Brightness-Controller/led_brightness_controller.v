`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 11:31:33
// Design Name: 
// Module Name: led_brightness_controller
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
////////////////////////////////////////////////////////////////////////////

 module led_brightness_controller (
    input clk,
    input reset,
    input [1:0] brightness_level,
    output reg led
);

    reg [3:0] duty_cycle;
    reg [2:0] counter;


    // Brightness level to duty-cycle conversion
    always @(*) begin

        case (brightness_level)

            2'b00: duty_cycle = 0;
            2'b01: duty_cycle = 2;
            2'b10: duty_cycle = 4;
            2'b11: duty_cycle = 6;

            default: duty_cycle = 0;

        endcase

    end


    // Counter logic
    always @(posedge clk) begin

        if (reset)
            counter <= 0;
        else
            counter <= counter + 1;

    end


    // PWM logic controls the LED
    always @(*) begin

        if (counter < duty_cycle)
            led = 1;
        else
            led = 0;

    end

endmodule