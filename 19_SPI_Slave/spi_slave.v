`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 10:52:51
// Design Name: 
// Module Name: spi_slave
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
//////////////////////////////////////////////////////////////////////////

 module spi_slave(

    input sclk,
    input rst,
    input cs,
    input mosi,

    output reg [7:0] rx_data,
    output reg done

);

// Internal Registers
reg [7:0] shift_reg;
reg [2:0] bit_count;

always @(posedge sclk or posedge rst)
begin

    if(rst)
    begin
        shift_reg <= 8'b0;
        rx_data   <= 8'b0;
        bit_count <= 3'b0;
        done      <= 1'b0;
    end

    else
    begin

        if(!cs)
        begin

            // Shift data in (MSB First)
            shift_reg <= {shift_reg[6:0], mosi};

            if(bit_count == 3'd7)
            begin
                rx_data   <= {shift_reg[6:0], mosi};
                bit_count <= 3'd0;
                done      <= 1'b1;
            end
            else
            begin
                bit_count <= bit_count + 1;
                done      <= 1'b0;
            end

        end

        else
        begin
            bit_count <= 3'd0;
            done      <= 1'b0;
        end

    end

end

endmodule