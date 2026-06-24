`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 11:28:53
// Design Name: 
// Module Name: sequence_detector
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


module sequence_detector(
    input clk,
    input rst,
    input x,
    output reg y
);

reg [2:0] state,next_state;

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

always @(posedge clk)
begin
    if(rst)
        state <= S0;
    else
        state <= next_state;
end

always @(*)
begin
    case(state)

    S0:
        if(x)
            next_state = S1;
        else
            next_state = S0;

    S1:
        if(x)
            next_state = S1;
        else
            next_state = S2;

    S2:
        if(x)
            next_state = S3;
        else
            next_state = S0;

    S3:
        if(x)
            next_state = S4;
        else
            next_state = S2;

    S4:
        if(x)
            next_state = S1;
        else
            next_state = S2;

    default:
        next_state = S0;

    endcase
end

always @(*)
begin
    if(state == S4)
        y = 1;
    else
        y = 0;
end

endmodule
