`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2026 11:40:27
// Design Name: 
// Module Name: pwm_generator
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

module pwm_generator (
    input clk,
    input reset,
    input [3:0] duty_cycle,
    output reg pwm_out
);

    // 3-bit counter: counts from 0 to 7
    reg [2:0] counter;


    // Counter logic
    always @(posedge clk) begin

        if (reset)
            counter <= 0;

        else
            counter <= counter + 1;

    end


    // PWM comparison logic
    always @(*) begin

        if (counter < duty_cycle)
            pwm_out = 1;

        else
            pwm_out = 0;

    end

endmodule
