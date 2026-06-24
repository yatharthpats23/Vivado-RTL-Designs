`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 17:54:10
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
    input clk,
    input rst,
    output reg red,
    output reg yellow,
    output reg green
);

reg [1:0] state,next_state;

parameter RED    = 2'b00,
          GREEN  = 2'b01,
          YELLOW = 2'b10;

always @(posedge clk)
begin
    if(rst)
        state <= RED;
    else
        state <= next_state;
end

always @(*)
begin
    case(state)

        RED:
            next_state = GREEN;

        GREEN:
            next_state = YELLOW;

        YELLOW:
            next_state = RED;

        default:
            next_state = RED;

    endcase
end

always @(*)
begin

    red    = 0;
    yellow = 0;
    green  = 0;

    case(state)

        RED:
            red = 1;

        GREEN:
            green = 1;

        YELLOW:
            yellow = 1;

    endcase
end

endmodule
