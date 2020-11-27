module selector(
    input a_1,a_2,s,
    output aout
);
    assign aout = (~s & a_1)|(s & a_2);
endmodule

module fourselector(
	input a_1,a_2,a_3,a_4,s_1,s_2,
    output aout
);
    wire carry_1,carry_2;
    selector selector_inst1(
        .a_1(carry_1 ),
        .a_2(carry_2 ),
        .s(s_1 ),
        .aout(aout )
    );
    selector selector_inst2(
        .a_1(a_1 ),
        .a_2(a_2 ),
        .s(s_2 ),
        .aout(carry_1 )
    );
    selector selector_inst3(
        .a_1(a_3 ),
        .a_2(a_4 ),
        .s(s_2 ),
        .aout(carry_2 )
    );
endmodule

module eightpriorencoder(
    input i0,i1,i2,i3,i4,i5,i6,i7,
    output y0,y1,y2
);
    assign y0 = i7 | ~i7 & ~i6 & ~i5 & i4 | ~i7 & ~i6 & ~i5 & ~i4 & i3 | ~i7 & ~i6 & ~i5 & ~i4 & ~i3 & ~i2 & i1;
    assign y1 = i7 | ~i7 & i6 | ~i7 & ~i6 & ~i5 & ~i4 & i3 | ~i7 & ~i6 & ~i5 & ~i4 & ~i3 & i2;
    assign y2 = i7 |  ~i7 & i6 | ~i7 & ~i6 & ~i5 & i4 | ~i7 & ~i6 & ~i5 & i4;

endmodule