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

// solution to q3
module q3_led_out(
    input clk, 
    input rst,
    output reg [3:0] hexplay_data, reg [2:0] hexplay_an
    );

    reg [3:0] minute;
    reg [3:0] second_10;
    reg [3:0] second_1;
    reg [3:0] second_0_1;
    // reg [2:0]a;
    // initial a = 0; 
    // reg [19:0] cnt;
    // wire pulse_10mhz;
    


    // time counter 50Hz
    reg [32:0] hexplay_cnt;
    // reg [32:0] timer;
    reg [26:0] timer_cnt;
        
        always@(posedge clk) 
        begin
	        if (timer_cnt >= 10000000)
		        timer_cnt <= 0;
	        else
		        timer_cnt <= timer_cnt + 1;
        end

        always@(posedge clk) 
        begin
	        if (hexplay_cnt >= (2000000/8))
		        hexplay_cnt <= 0;
	        else
		        hexplay_cnt <= hexplay_cnt + 1;
        end

        always@(posedge clk) 
        begin
	        if (hexplay_cnt == 0)
            begin
		        if (hexplay_an == 7)
			        hexplay_an <= 0;
		    else
			    hexplay_an <= hexplay_an + 2;
	        end
        end


        // always@(posedge clk) 
        // begin
	    //     if (hexplay_cnt == 0)
        //     begin
		//         if (timer == 50000)
		// 	        timer <= 0;
		//     else
		// 	    timer <= timer + 1;
	    //     end
        // end
    // always@(posedge clk)
    //     begin
    //         if(cnt >= 20'hf4240)
    //             cnt <= 20'h0;
    //         else
    //             cnt <= cnt + 20'h1;
    //     end
    
    // assign pulse_10mhz = (cnt == 20'h1);
    
    // always @(posedge clk) 
    // begin
    //     if(pulse_10mhz)
    //         a <= a+1;
    //     if(a == 3'b100)
    //     begin
    //         a <= 3'b000;
    //     end
    // end
    initial
    begin
        second_0_1 <= 4'b0000;
        second_1 <= 4'b0000;
        second_10 <= 4'b0000;
        minute <= 4'b0000;    
    end

    always @(posedge clk) 
    begin
        if(rst)
        begin
            second_0_1 <= 4'b0100;
            second_1 <= 4'b0011;
            second_10 <= 4'b0010;
            minute <= 4'b0001;
            // timer
        end
        else
        begin
            if(timer_cnt == 0)
            begin
                second_0_1 <= second_0_1 + 1;
                if(second_0_1 == 4'b1001)
                begin
                    second_0_1 <= 4'b0000;
                    second_1 <= second_1 + 1;
                    if(second_1 == 4'b1001)
                    begin
                        second_1 <= 4'b0000;
                        second_10 <= second_10 + 1;
                        if(second_10 == 4'b0101)
                        begin
                            second_10 <= 4'b0000;
                            minute = minute + 1;
                        end
                    end
                end    
            end       
        end
    end
    
        
    always @(posedge clk) 
    begin
    case(hexplay_an)
        6:
        begin
            // hexplay_an <= a;
            hexplay_data <= {minute[3],minute[2],minute[1],minute[0]};
        end
        4:
        begin
            // hexplay_an <= a;
            hexplay_data <= {second_10[3],second_10[2],second_10[1],second_10[0]};
        end
        2:
        begin
            // hexplay_an <= a;
            hexplay_data <= {second_1[3],second_1[2],second_1[1],second_1[0]};
        end
        0:
        begin
            // hexplay_an <= a;
            hexplay_data <= {second_0_1[3],second_0_1[2],second_0_1[1],second_0_1[0]};
        end
    endcase
    end
endmodule
