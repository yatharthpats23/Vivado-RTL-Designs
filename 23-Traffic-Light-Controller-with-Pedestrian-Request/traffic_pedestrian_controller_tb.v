`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 17:42:43
// Design Name: 
// Module Name: traffic_pedestrian_controller_tb
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

module traffic_pedestrian_controller_tb;

reg clk;
reg reset;
reg ped_request;

wire green;
wire yellow;
wire red;
wire walk;


// Instantiate DUT
traffic_pedestrian_controller #(
    .YELLOW_TIME(3),
    .RED_TIME(2),
    .WALK_TIME(5)
) DUT (
    .clk(clk),
    .reset(reset),
    .ped_request(ped_request),
    .green(green),
    .yellow(yellow),
    .red(red),
    .walk(walk)
);


// Clock generation
always #5 clk = ~clk;


// Test sequence
initial begin

    clk = 0;
    reset = 1;
    ped_request = 0;

    #20;

    reset = 0;

    #20;

    // Pedestrian presses button briefly
    ped_request = 1;

    #10;

    // Button released after one clock cycle
    ped_request = 0;

    #200;

    $finish;

end

endmodule