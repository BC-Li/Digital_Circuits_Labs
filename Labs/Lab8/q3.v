`timescale 1ns / 1ps

// solution to q3
module q3(
    input clk, 
    input rst,
    input dir,
    input button,
    output reg [3:0] hexplay_data, reg [2:0] hexplay_an
    );

    reg [31:0] data;
    wire button_edge;

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
		        if (hexplay_an == 7)
			        hexplay_an <= 0;
		    else
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
		    7: hexplay_data = data[31:28];
	    endcase
    end

    always@(posedge clk) begin
            if(rst == 1)begin
                data <= 32'h1f;
            end
            else begin
            if(button_edge == 1)begin
                if (dir) begin
    			    data <= data - 1;
    		    end
    		    else begin
    			    data <= data + 1;
    		    end    
            end
            else begin
                data <= data;
            end
            end
    	end
    
endmodule


module signal_edge(
input clk,
input button,
output button_edge);
reg button_r1,button_r2;
always@(posedge clk)
 button_r1 <= button;
always@(posedge clk)
 button_r2 <= button_r1;
assign button_edge = button_r1 & (~button_r2);
endmodule