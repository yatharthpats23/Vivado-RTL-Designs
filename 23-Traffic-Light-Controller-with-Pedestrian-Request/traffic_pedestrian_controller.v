`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 17:32:51
// Design Name: 
// Module Name: traffic_pedestrian_controller
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


module traffic_pedestrian_controller #(
    parameter YELLOW_TIME = 3,
    parameter RED_TIME    = 2,
    parameter WALK_TIME   = 5
)(
    input clk,
    input reset,
    input ped_request,

    output reg green,
    output reg yellow,
    output reg red,
    output reg walk
);

// State definitions
localparam S_GREEN  = 2'b00;
localparam S_YELLOW = 2'b01;
localparam S_RED    = 2'b10;
localparam S_WALK   = 2'b11;

// Internal registers
reg [1:0] state;
reg [31:0] timer;
reg request_pending;


// Sequential logic
always @(posedge clk) begin

    if (reset) begin
        state <= S_GREEN;
        timer <= 0;
        request_pending <= 0;
    end

    else begin

        // Remember a pedestrian request
        if (ped_request)
            request_pending <= 1;

        case (state)

            S_GREEN: begin
                timer <= 0;

                if (request_pending)
                    state <= S_YELLOW;
            end

            S_YELLOW: begin
                if (timer == YELLOW_TIME - 1) begin
                    timer <= 0;
                    state <= S_RED;
                end
                else begin
                    timer <= timer + 1;
                end
            end

            S_RED: begin
                if (timer == RED_TIME - 1) begin
                    timer <= 0;
                    state <= S_WALK;
                end
                else begin
                    timer <= timer + 1;
                end
            end

            S_WALK: begin
                if (timer == WALK_TIME - 1) begin
                    timer <= 0;
                    state <= S_GREEN;
                    request_pending <= 0;
                end
                else begin
                    timer <= timer + 1;
                end
            end

            default: begin
                state <= S_GREEN;
                timer <= 0;
                request_pending <= 0;
            end

        endcase

    end

end


// Output logic
always @(*) begin

    green  = 0;
    yellow = 0;
    red    = 0;
    walk   = 0;

    case (state)

        S_GREEN:
            green = 1;

        S_YELLOW:
            yellow = 1;

        S_RED:
            red = 1;

        S_WALK: begin
            red  = 1;
            walk = 1;
        end

        default:
            green = 1;

    endcase

end

endmodule