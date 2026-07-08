`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2026 11:44:06
// Design Name: 
// Module Name: pwm_generator_tb
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

module pwm_generator_tb;

reg clk;
reg reset;
reg [3:0] duty_cycle;

wire pwm_out;


// Instantiate DUT
pwm_generator DUT (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty_cycle),
    .pwm_out(pwm_out)
);


// Clock generation
always #5 clk = ~clk;


// Test sequence
initial begin

    clk = 0;
    reset = 1;
    duty_cycle = 0;

    #20;
    reset = 0;

    // 0% duty cycle
    duty_cycle = 0;
    #80;

    // 25% duty cycle
    duty_cycle = 2;
    #80;

    // 50% duty cycle
    duty_cycle = 4;
    #80;

    // 75% duty cycle
    duty_cycle = 6;
    #80;

    // 100% duty cycle
    duty_cycle = 8;
    #80;

    $finish;

end

endmodule
