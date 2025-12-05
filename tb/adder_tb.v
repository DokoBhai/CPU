module adder_tb();

    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    adder8 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("build/adder8.vcd");
        $dumpvars(0, adder_tb);

        a = 8'b00000001; b = 8'b00000010; cin = 0; #10;
        a = 8'b11001100; b = 8'b00110011; cin = 0; #10;
        a = 8'b11111111; b = 8'b00000001; cin = 0; #10;
        a = 8'b10101010; b = 8'b01010101; cin = 1; #10;

        #20 $finish;
    end

endmodule
