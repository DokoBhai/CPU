module adder ();

  reg clk;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("build/adder.vcd");
    $dumpvars(0, adder);
    #200 $finish;
  end


endmodule
