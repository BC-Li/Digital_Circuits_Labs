`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 20:48:29
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


module mux(
    input [2:0] x, [2:0] e,
    output reg [7:0] y
    );
    always@(*)
        if(e != 3'b100)
        begin
            y <= 8'b0000_0000;
        end
        else
        begin
            case (x)
            3'b000: y <= 8'b0000_0001;
            3'b001: y <= 8'b0000_0010;
            3'b010: y <= 8'b0000_0100;
            3'b011: y <= 8'b0000_1000;
            3'b100: y <= 8'b0001_0000;
            3'b101: y <= 8'b0010_0000;
            3'b110: y <= 8'b0100_0000;
            3'b111: y <= 8'b1000_0000;
            endcase
        end
        
endmodule
