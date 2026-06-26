`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 12:25:31
// Design Name: 
// Module Name: uart_rx
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
////////////////////////////////////////////////////////////////////////////////
module uart_rx(
    input clk,
    input rst,
    input rx,
    output reg [7:0] data_out,
    output reg done
);

reg [1:0] state;
reg [2:0] bit_count;

parameter IDLE  = 2'b00,
          START = 2'b01,
          DATA  = 2'b10,
          STOP  = 2'b11;

always @(posedge clk)
begin
    if(rst)
    begin
        state <= IDLE;
        bit_count <= 0;
        data_out <= 8'b0;
        done <= 0;
    end
    else
    begin
        case(state)

        IDLE:
        begin
            done <= 0;
            if(rx == 0)
                state <= START;
        end

        START:
        begin
            state <= DATA;
        end

        DATA:
        begin
            data_out[bit_count] <= rx;

            if(bit_count == 7)
            begin
                bit_count <= 0;
                state <= STOP;
            end
            else
                bit_count <= bit_count + 1;
        end

        STOP:
        begin
            done <= 1;
            state <= IDLE;
        end

        endcase
    end
end

endmodule
