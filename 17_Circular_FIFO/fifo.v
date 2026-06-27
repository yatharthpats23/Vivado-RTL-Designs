`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 11:56:37
// Design Name: 
// Module Name: fifo
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


module fifo(

    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [7:0] data_in,

    output reg [7:0] data_out,
    output full,
    output empty

);

    //=====================================================
    // FIFO Memory
    //=====================================================

    reg [7:0] mem [0:7];

    //=====================================================
    // Pointers
    //=====================================================

    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr;

    //=====================================================
    // Number of stored elements
    //=====================================================

    reg [3:0] count;

    //=====================================================
    // Status Flags
    //=====================================================

    assign full  = (count == 8);
    assign empty = (count == 0);

    //=====================================================
    // FIFO Logic
    //=====================================================

    always @(posedge clk)
    begin

        if(rst)
        begin
            wr_ptr   <= 0;
            rd_ptr   <= 0;
            count    <= 0;
            data_out <= 0;
        end

        else
        begin

            //-------------------------------------------------
            // Case 1 : Write Only
            //-------------------------------------------------

            if(wr_en && !rd_en && !full)
            begin

                mem[wr_ptr] <= data_in;

                if(wr_ptr == 7)
                    wr_ptr <= 0;
                else
                    wr_ptr <= wr_ptr + 1;

                count <= count + 1;

            end

            //-------------------------------------------------
            // Case 2 : Read Only
            //-------------------------------------------------

            else if(rd_en && !wr_en && !empty)
            begin

                data_out <= mem[rd_ptr];

                if(rd_ptr == 7)
                    rd_ptr <= 0;
                else
                    rd_ptr <= rd_ptr + 1;

                count <= count - 1;

            end

            //-------------------------------------------------
            // Case 3 : Read and Write Together
            //-------------------------------------------------

            else if(wr_en && rd_en && !full && !empty)
            begin

                // Write

                mem[wr_ptr] <= data_in;

                if(wr_ptr == 7)
                    wr_ptr <= 0;
                else
                    wr_ptr <= wr_ptr + 1;

                // Read

                data_out <= mem[rd_ptr];

                if(rd_ptr == 7)
                    rd_ptr <= 0;
                else
                    rd_ptr <= rd_ptr + 1;

                // Count remains unchanged

            end

            //-------------------------------------------------
            // Case 4 : No Operation
            //-------------------------------------------------

            else
            begin

                wr_ptr   <= wr_ptr;
                rd_ptr   <= rd_ptr;
                count    <= count;
                data_out <= data_out;

            end

        end

    end

endmodule
