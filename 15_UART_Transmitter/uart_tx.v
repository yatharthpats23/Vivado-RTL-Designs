`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 18:53:30
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input clk,
    input rst,
    input start,
    input [7:0] data_in,
    output reg tx
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
        tx <= 1;
        bit_count <= 0;
    end

    else
    begin

        case(state)

        IDLE:
        begin
            tx <= 1;

            if(start)
                state <= START;
        end

        START:
        begin
            tx <= 0;
            state <= DATA;
        end

        DATA:
        begin
            tx <= data_in[bit_count];

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
            tx <= 1;
            state <= IDLE;
        end

        endcase

    end

end

endmodule
