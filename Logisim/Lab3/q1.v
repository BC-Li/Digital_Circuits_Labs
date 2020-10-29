//  solution to q2
module d_ff_tri(
    input clk,rst,d,
    output reg q
);
    always@(posedge clk)
        begin
            if(rst == 0)
                q<=0;
            else
                q<=d;
        end
endmodule
//  solution to q3
module Counter(
    input clk,rst,
    output reg [3:0] q
);
    always@(posedge clk)
        begin
            if(rst == 0)
                q <= 4'b0;
            else
                q <= q + 4'b1;
        end
endmodule
//solution to q4
module LessenCounter(
    input clk,rst,
    output reg [3:0] q
);
    always@(posedge clk)
        begin
            if(rst == 0)
                q <= 4'b1001;
            else
                q <= q - 4'b1;
        end
endmodule
//solution to q5
module LessenCounter_2(
    input clk,rst,
    output reg [3:0] q
);
    always@(posedge clk)
        begin
            if(rst == 1)
                q <= 4'b1001;
            else
                q <= q - 4'b1;
        end
endmodule