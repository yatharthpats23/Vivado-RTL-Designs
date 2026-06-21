`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 18:00:00
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
module stimuli();

reg [1:0] a, b;
wire greater, equal, less;

// DUT Instantiation
comparator_2bit dut (
    .a(a),
    .b(b),
    .greater(greater),
    .equal(equal),
    .less(less)
);

initial begin

    a = 2'b00; b = 2'b00;
#10 a = 2'b00; b = 2'b01;
#10 a = 2'b01; b = 2'b00;
#10 a = 2'b01; b = 2'b01;
#10 a = 2'b10; b = 2'b01;
#10 a = 2'b01; b = 2'b10;
#10 a = 2'b11; b = 2'b10;
#10 a = 2'b10; b = 2'b11;
#10 a = 2'b11; b = 2'b11;

#10 $finish;

end

initial begin
    $monitor("Time=%0t a=%b b=%b greater=%b equal=%b less=%b",
              $time, a, b, greater, equal, less);
end

endmodule
