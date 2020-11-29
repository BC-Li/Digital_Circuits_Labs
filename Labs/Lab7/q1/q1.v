`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/23 21:18:13
// Design Name: 
// Module Name: q1
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


module q1(
    input [3:0] sw,
    output [7:0] led
    );

    dist_mem_gen_0 mem(
        .a(sw),
        .spo(led)
    );
endmodule
