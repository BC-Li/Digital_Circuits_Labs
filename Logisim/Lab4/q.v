//  answer to q1
module test(
    input a,
    output reg b
);
    always@(*)
    begin
        if(a) b = 1'b0;
        else b = 1'b1;
    end
endmodule

//  answer to q2
module test(
    input [4:0] a,
    output reg [4:0] b    
);
    always@(*)
        b = a;
endmodule

//  answer to q3
module test(
input [7:0] a,b,    //      when a = 8'b0011_0011, 
                    //           b = 8'b1111_0000
output [7:0] c,d,e,f,g,h,i,j,k );
assign c = a & b;   //           c = 8'b0011_0000;
assign d = a | b;   //           d = 8'b1111_0011;
assign e = a ^ b;   //           e = 8'b1100_0011;
assign f = ~a;      //           f = 8'b1100_1100;
assign g = {a[3:0],b[3:0]};//    g = 8'b0011_0000;
assign h = a >> 3;  //           h = 8'b0000_0110;
assign i = &b;      //           i = 8'b0000_0000;
assign j = (a > b) ? a : b;//    j = b = 8'b1111_0000;
assign k = a - b;   //           k = -8'b1011_1101;
endmodule

//  answer to q4

module sub_test(
    input a,b,
    // output reg c
    output c
);
    assign c = (a<b)? a : b;
endmodule

module test(
    input a,b,c,
    output o
    );
    //  reg temp;
    wire temp; 
    //  sub_test(.a(a),.b(b),temp);
    sub_test sub_test_1(
        .a  (a),
        .b  (b),
        .c  (temp)
        );
    // sub_test(temp,c,.c(o));
    sub_test sub_test_2(temp,c,o);
endmodule

//  answer to q5

module sub_test(
// input a,b);
// output o;
    input a,b,
    output o
); //   output signal can't be declared outside that zone 
    
    assign o = a + b;
    
endmodule

module test(
    input  a,b,
    output wire c
);
    
    sub_test sub_test_1(
        .a      (a),
        .b      (b),
        .o      (c));

//   we can't use module instantiation in an always block

endmodule

