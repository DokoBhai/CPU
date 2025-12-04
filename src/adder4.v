module adder4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

    wire c1, c2, c3;

    adder fa0(a[0], b[0], cin, sum[0], c1);
    adder fa1(a[1], b[1], c1, sum[1], c2);
    adder fa2(a[2], b[2], c2, sum[2], c3);
    adder fa3(a[3], b[3], c3, sum[3], cout);

endmodule
