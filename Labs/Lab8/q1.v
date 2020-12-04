// original source code
// module test(
//     input clk,rst,
//     output led
//     );
//     reg [1:0] cnt;
//     always@(posedge clk or posedge rst_n)
//         begin
//             if(rst)
//                 cnt <= 2'b0;
//             else
//                 cnt <= cnt + 1'b1;
//         end
//     assign led = (cnt==2'b11) ? 1'b1 : 1'b0;
// endmodule

// divideby3FSM

module divideby3FSM(
    input clk,
    input reset,
    output led 
);
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;

    reg [1:0] state;
    reg [1:0] nextstate;

    // state register
    always@ (posedge clk or posedge reset)
    begin
        if (reset) state <= s0;
        else       state <= nextstate;
    end

    //  next state logic
    always @(*) begin
        case (state)
            s0:      nextstate = s1;
            s1:      nextstate = s2;
            s2:      nextstate = s3;
            s3:      nextstate = s0;
            default: nextstate = s0;
        endcase
    end

    //  output logic
    assign led = (state==2'b11) ? 1'b1 : 1'b0;
endmodule
