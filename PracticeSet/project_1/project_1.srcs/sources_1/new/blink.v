`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/12 21:19:33
// Design Name: 
// Module Name: blink
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


module blink(
    input clk,
    output reg led
    );
    reg [31:0] cnt;
    always@(posedge clk)begin
        if(cnt < 32'h05F5E100) cnt <= cnt + 32'h1;
        else cnt <= 32'h0;
    end

    always@(posedge clk)begin
        if(cnt < 32'h02FAF080) led <= 1'b1;
        else led <= 1'b0;
    end
endmodule
