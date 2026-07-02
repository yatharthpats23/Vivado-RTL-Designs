`timescale 1ns / 1ps

module stopwatch
#(
    parameter CLOCK_FREQ = 100_000_000
)
(
    input  clk,
    input  rst,
    input  start,
    input  pause,

    output reg [5:0] seconds,
    output reg [5:0] minutes
);

//====================================================
// State Encoding
//====================================================

localparam IDLE    = 2'b00,
           RUNNING = 2'b01,
           PAUSED  = 2'b10;

//====================================================
// Registers
//====================================================

reg [1:0] state;

reg [31:0] clk_div;

reg one_sec_tick;

//====================================================
// Tick Generator
// Generates one pulse every second
//====================================================

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        clk_div      <= 32'd0;
        one_sec_tick <= 1'b0;
    end

    else
    begin

        if(clk_div == CLOCK_FREQ-1)
        begin
            clk_div      <= 32'd0;
            one_sec_tick <= 1'b1;
        end

        else
        begin
            clk_div      <= clk_div + 1'b1;
            one_sec_tick <= 1'b0;
        end

    end

end

//====================================================
// Finite State Machine (FSM)
//====================================================

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        state <= IDLE;
    end

    else
    begin

        case(state)

        //--------------------------------------------
        // IDLE
        //--------------------------------------------

        IDLE:
        begin

            if(start)
                state <= RUNNING;

        end

        //--------------------------------------------
        // RUNNING
        //--------------------------------------------

        RUNNING:
        begin

            if(pause)
                state <= PAUSED;

        end

        //--------------------------------------------
        // PAUSED
        //--------------------------------------------

        PAUSED:
        begin

            if(start)
                state <= RUNNING;

        end

        //--------------------------------------------

        default:
            state <= IDLE;

        endcase

    end

end


//====================================================
// Stopwatch Counter (MM:SS)
//====================================================

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin

        seconds <= 6'd0;
        minutes <= 6'd0;

    end

    else
    begin

        if(state == RUNNING && one_sec_tick)
        begin

            //------------------------------------------------
            // Seconds Counter
            //------------------------------------------------

            if(seconds == 6'd59)
            begin

                seconds <= 6'd0;

                //--------------------------------------------
                // Minutes Counter
                //--------------------------------------------

                if(minutes == 6'd59)
                    minutes <= 6'd0;

                else
                    minutes <= minutes + 1'b1;

            end

            else
            begin

                seconds <= seconds + 1'b1;

            end

        end

    end

end

endmodule