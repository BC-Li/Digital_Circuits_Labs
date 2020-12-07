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

// solution to q4
module q4(
    input clk, 
    // input rst,
    // input dir,
    input sw,
    input button,
    output reg [3:0] hexplay_data, reg [2:0] hexplay_an
    );

    reg [2:0] curr_state;
    reg [2:0] next_state;
    reg [27:0] data;
    wire button_edge;
    reg [3:0] counter;
    reg [3:0] inputdata;

//  input

    always@(posedge clk)
    begin
        if(button_edge == 1)begin
            inputdata <= {inputdata[2:0],sw};
        end
    end

//  display input to data

    always@(posedge clk)
    begin
        data[3:0] <= {3'b000,inputdata[0]};
        data[7:4] <= {3'b000,inputdata[1]};
        data[11:8] <= {3'b000,inputdata[2]};
        data[15:12] <= {3'b000,inputdata[3]};
    end

//  status

    parameter s0=3'b000; // 0
    parameter s1=3'b001; // 1
    parameter s2=3'b010; // 11
    parameter s3=3'b011; // 110
    parameter s4=3'b100; // 1100

//  status switch

    initial 
    begin
            counter = 0;
    end

    always @(*) begin
        case (curr_state)
            s0:begin
                if(sw == 1 & button_edge == 1)begin
                    next_state = s1;
                end
                if(sw == 0 & button_edge == 1)begin
                    next_state = s0;
                end
            end
            s1:begin
                if(sw == 1 & button_edge == 1)begin
                    next_state = s2;
                end
                if(sw == 0 & button_edge == 1)begin
                    next_state = s0;
                end
            end
            s2:begin
                if(sw == 1 & button_edge == 1)begin
                    next_state = s2;
                end
                if(sw == 0 & button_edge == 1)begin
                    next_state = s3;
                end
            end
            s3:begin
                if(sw == 1 & button_edge == 1)begin
                    next_state = s1;
                end
                if(sw == 0 & button_edge == 1)begin
                    next_state = s4;
                end
            end
            s4:begin
                if(sw == 1 & button_edge == 1)begin
                    next_state = s1;
                end
                if(sw == 0 & button_edge == 1)begin
                    next_state = s0;
                end
            end
            default:begin
                next_state = next_state;
            end 
        endcase
    end
   
    always@(posedge clk) 
    begin
            if(button_edge)
            begin
                if(curr_state == s3 & sw == 0)
                begin
                    counter <= counter + 1;
                end
                curr_state <= next_state;
            end
    end

//  button

    signal_edge signal_edge_1(clk,button,button_edge);

//  Hexplay 50Hz

    reg [32:0] hexplay_cnt;
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
                if (hexplay_an == 8)    //  hexplay
			        hexplay_an <= 0;
		        if (hexplay_an == 0)    //  hexplay
			        hexplay_an <= hexplay_an + 1;
		        if (hexplay_an == 1)    //  hexplay
			        hexplay_an <= hexplay_an + 1;
		        if (hexplay_an == 2)    //  hexplay
			        hexplay_an <= hexplay_an + 1;
		        if (hexplay_an == 3)    //  hexplay
			        hexplay_an <= hexplay_an + 2;
		        if (hexplay_an == 5)    //  hexplay
			        hexplay_an <= hexplay_an + 2;
		        if (hexplay_an == 7)    //  hexplay
			        hexplay_an <= hexplay_an + 1;
        end
        end

    always@(*) begin
	    case(hexplay_an)
		    0: hexplay_data = data[3:0];
		    1: hexplay_data = data[7:4];
		    2: hexplay_data = data[11:8];
		    3: hexplay_data = data[15:12];
            4: hexplay_data = data[19:16];
		    5: hexplay_data = data[23:20];
		    6: hexplay_data = data[27:24];
		    7: hexplay_data = data[27:24];
	    endcase
    end

//  counter logic    

    always@(posedge clk) begin
        data[23:20] <= counter;
    end

//  state logic

    always@(posedge clk) begin
            case (curr_state)
                s0:begin
                    data[27:24] <= 3'b0;
                end 
                s1:begin
                    data[27:24] <= 3'b1;
                end 
                s2:begin
                    data[27:24] <= 3'b010;
                end 
                s3:begin
                    data[27:24] <= 3'b011;
                end 
                s4:begin
                    data[27:24] <= 3'b100;
                end 
                default: data[27:24] <= 3'b0; 
            endcase
    	end
    
endmodule


module signal_edge(
    input clk,
    input button,
    output button_edge
    );
    reg button_r1,button_r2;    
    
    always@(posedge clk)
        button_r1 <= button;
    
    always@(posedge clk)
        button_r2 <= button_r1;
    
    assign button_edge = button_r1 & (~button_r2);

endmodule