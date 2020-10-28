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
        