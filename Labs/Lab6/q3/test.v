`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/20 11:08:49
// Design Name: 
// Module Name: test
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


module test(
    input clk,
    input rst,
    output reg [7:0] led
    );
    reg [29:0] counter;

    always@(posedge clk or posedge rst)
    begin
        if (rst == 1)
        begin
            counter <= 30'b0;
        end
        else begin
            counter <= counter + 30'b1;
        end
    end
    always@(posedge clk or posedge rst)
    begin
        if (rst == 1)
        begin
            led <= 8'haa;
        end

        else
        begin
            led <= {counter[29],counter[28],counter[27],counter[26],counter[25],counter[24],counter[23],counter[22]}; 
        end

    end
endmodule