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

// solution to q2
module led_out(
    input [3:0] sw_1,[3:0]sw_2,
    input clk, 
    output reg [3:0] hexplay_data, reg [2:0] hexplay_an
    // output     [3:0] led_1, [3:0] led_2,
    // ,output reg counter
    );
    // wire [7:0] led_1;
    // wire [7:0] led_2;
    // dist_mem_gen_0 mem_1(
    //     .a(sw_1),
    //     .spo(led_1)
    // );

    // dist_mem_gen_0 mem_2(
    //     .a(sw_2),
    //     .spo(led_2)
    // );
    // reg a;
    // initial a = 0; 
    // reg [19:0] cnt;
    // wire pulse_10mhz;
    // always@(posedge clk)
    //     begin
    //         if(cnt>= 20'hf4240)
    //             cnt <= 20'h0;
    //         else
    //             cnt <= cnt + 20'h1;
    //     end

    // time counter 50Hz
    reg [32:0] hexplay_cnt;

        always@(posedge clk) 
        begin
	        if (hexplay_cnt >= (2000000 / 8))
		        hexplay_cnt <= 0;
	        else
		        hexplay_cnt <= hexplay_cnt + 1;
        end

        always@(posedge clk) 
        begin
	        if (hexplay_cnt == 0)
            begin
		        if (hexplay_an == 1)
			        hexplay_an <= 0;
		    else
			    hexplay_an <= hexplay_an + 1;
	        end
        end
    
    // assign pulse_10mhz = (cnt == 20'h1);
    // always @(posedge clk) 
    // begin
    //     if(pulse_10mhz)
    //         a <= ~a;
    // end
        
    // always @(posedge clk)
    always@(*) 
    begin
        // if(a)
        case(hexplay_an)
        0:
        begin
            // hexplay_an <= {1,1,1};
            // hexplay_data <= {led_1[0],led_1[1],led_1[2]};
            hexplay_data <= {sw_1[0],sw_1[1],sw_1[2],sw_1[3]};
        end
        // if(~a)
        1:
        begin
            // hexplay_an <= {1,1,0};
            // hexplay_data <= {led_2[0],led_2[1],led_2[2]};
            hexplay_data <= {sw_2[0],sw_2[1],sw_2[2],sw_2[3]};
        end
        // counter <= ~counter;
        endcase
    end
endmodule
