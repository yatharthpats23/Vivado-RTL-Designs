`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 18:08:38
// Design Name: 
// Module Name: seven_segment_driver
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

module seven_segment_driver
(
    input  [3:0] digit,
    output reg [6:0] seg
);

//====================================================
// Seven-Segment Decoder
// Common Cathode: 1 = ON, 0 = OFF
// seg[6:0] = {a, b, c, d, e, f, g}
//====================================================

always @(*)
begin

    case(digit)

        4'd0: seg = 7'b1111110;
        4'd1: seg = 7'b0110000;
        4'd2: seg = 7'b1101101;
        4'd3: seg = 7'b1111001;
        4'd4: seg = 7'b0110011;
        4'd5: seg = 7'b1011011;
        4'd6: seg = 7'b1011111;
        4'd7: seg = 7'b1110000;
        4'd8: seg = 7'b1111111;
        4'd9: seg = 7'b1111011;

        default: seg = 7'b0000000;

    endcase

end

endmodule
