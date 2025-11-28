module adder ();

  reg clk;
  reg a;
  reg b;
  wire sum;
  wire carry;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  assign sum = a ^ b;
  assign carry = a & b;

  initial begin
    a = 0; b = 0;
    #10 a = 1;
    #10 b = 1;
    #10 a = 0;
  end

  initial begin
    $dumpfile("build/adder.vcd");
    $dumpvars(0, adder);
    #200 $finish;
  end


endmodule
