module adder_tb ();

  reg a;
  reg b;
  reg cin;

  wire sum;
  wire carry;

  adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    $dumpfile("build/adder.vcd");
    $dumpvars(0, adder_tb);

    a = 0; b = 0; cin = 0;
    #10 a = 1;
    #10 b = 1;
    #10 cin = 1;
    #10 a = 0;
    #10 b = 0;
    #10 cin = 0;
  end

endmodule
