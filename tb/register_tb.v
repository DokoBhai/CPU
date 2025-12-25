module register_tb;

reg clk;
reg rst;
reg en;
reg [7:0] d;
wire [7:0] q;

register8 dut (
  .clk(clk),
  .rst(rst),
  .en(en),
  .d(d),
  .q(q)
);

// Clock generator: 10 time unit period
always #5 clk = ~clk;

initial begin
  $dumpfile("build/register.vcd");
  $dumpvars(0, register_tb);

  // Initial values
  clk = 0;
  rst = 1;
  en  = 0;
  d   = 8'b00000000;

  // Hold reset for 1 cycle
  #10;
  rst = 0;

  // Load data
  #10;
  en = 1;
  d = 8'b11000011;

  #10;
  d = 8'b11101001;

  // Disable enable (should hold value)
  #10;
  en = 0;
  d = 8'b00000000;

  #20;
  $finish;
end

endmodule
