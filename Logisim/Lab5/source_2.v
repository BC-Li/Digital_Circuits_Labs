`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 17:20:09
// Design Name: 
// Module Name: source
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


module lab05(
input [3:0] a, b, c, d,
input sel,
output reg [3:0] o);

always @(*)
begin
    case(sel)
        2'b00: o = a;
        2'b01: o = b;
        2'b10: o = c;
        2'b11: o = d;
        default: o = 4'h0;//
    endcase
end
endmodule 
