module adder ();

  reg clk;
  reg a;
  reg b;
  output c;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  assign c = a ^ b;

  initial begin
    a = 1;
    #10
    b = 1;
  end

  initial begin
    $dumpfile("build/adder.vcd");
    $dumpvars(0, adder);
    #200 $finish;
  end


endmodule
