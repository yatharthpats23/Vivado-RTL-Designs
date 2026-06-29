`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 18:02:15
// Design Name: 
// Module Name: spi_master
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

module spi_master(

    input clk,
    input rst,
    input start,
    input [7:0] data_in,

    output reg mosi,
    output reg sclk,
    output reg cs,
    output reg done

);

//=====================================================
// Internal Registers
//=====================================================

reg [7:0] shift_reg;
reg [2:0] bit_count;
reg [2:0] clk_div;

reg [1:0] state;

//=====================================================
// FSM States
//=====================================================

parameter IDLE  = 2'b00,
          LOAD  = 2'b01,
          SHIFT = 2'b10,
          DONE  = 2'b11;

//=====================================================
// Clock Divider (Generate SPI Clock)
//=====================================================

always @(posedge clk)
begin

    if(rst)
    begin
        clk_div <= 0;
        sclk <= 0;
    end

    else if(state == SHIFT)
    begin

        if(clk_div == 3)
        begin
            clk_div <= 0;
            sclk <= ~sclk;
        end

        else
            clk_div <= clk_div + 1;

    end

    else
    begin
        clk_div <= 0;
        sclk <= 0;
    end

end

//=====================================================
// SPI FSM
//=====================================================

always @(posedge clk)
begin

    if(rst)
    begin

        state <= IDLE;

        shift_reg <= 0;
        bit_count <= 0;

        cs <= 1;
        done <= 0;
        mosi <= 0;

    end

    else
    begin

        case(state)

        //-------------------------------------------------
        // IDLE
        //-------------------------------------------------

        IDLE:
        begin

            cs <= 1;
            done <= 0;
            bit_count <= 0;

            if(start)
                state <= LOAD;

        end

        //-------------------------------------------------
        // LOAD
        //-------------------------------------------------

        LOAD:
        begin

            shift_reg <= data_in;

            cs <= 0;

            state <= SHIFT;

        end

        //-------------------------------------------------
        // SHIFT
        //-------------------------------------------------

        SHIFT:
        begin

            // Shift only when SPI clock rises
            if(clk_div == 3 && sclk == 0)
            begin

                mosi <= shift_reg[7];

                shift_reg <= {shift_reg[6:0],1'b0};

                if(bit_count == 7)
                    state <= DONE;
                else
                    bit_count <= bit_count + 1;

            end

        end

        //-------------------------------------------------
        // DONE
        //-------------------------------------------------

        DONE:
        begin

            cs <= 1;

            done <= 1;

            state <= IDLE;

        end

        endcase

    end

end

endmodule
