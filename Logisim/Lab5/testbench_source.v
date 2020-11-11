`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 22:15:59
// Design Name: 
// Module Name: testbench_source
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


//module testbench_q1();
//    reg a, b;
    
//    initial a = 1;
//    always #200 a = ~a;
    
//    initial 
//    begin
//        b = 0;
//        forever
//            begin
//                #100 b <= 1;
//                #175 b <= 0; 
//                #75  b <= 1;
//            end
//    end
//endmodule

module testbench_q2();
    reg clk,rst_n,d;
    wire o;
    d_ff_r d_ff_r_test(clk,rst_n,d,o);

    initial clk = 0;
    always #5 clk = ~clk;

    initial
    begin
        rst_n = 0;
        forever 
            begin
                # 27.5 rst_n <= 1;
            end
    end

    initial
    begin
        d = 0;
        forever
            begin
                # 12.5 d <= 1;
                # 37.5 d <= 0;
            end
    end
endmodule

