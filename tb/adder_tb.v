module adder_tb();

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    adder4 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("build/adder4.vcd");
        $dumpvars(0, adder_tb);

        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        a = 4'b1100; b = 4'b0011; cin = 0; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1010; b = 4'b0101; cin = 1; #10;

        #20 $finish;
    end

endmodule
