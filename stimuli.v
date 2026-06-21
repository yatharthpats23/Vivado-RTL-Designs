`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 18:16:40
// Design Name: 
// Module Name: stimuli
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

module stimuli;

reg [3:0] a,b;
reg [2:0] sel;

wire [3:0] y;

alu_4bit uut(
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
);

initial
begin

a = 4'b1010;   //10
b = 4'b0011;   //3

sel=3'b000; #10;
sel=3'b001; #10;
sel=3'b010; #10;
sel=3'b011; #10;
sel=3'b100; #10;
sel=3'b101; #10;
sel=3'b110; #10;
sel=3'b111; #10;

$finish;

end

endmodule
