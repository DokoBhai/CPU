module subtractor_tb ();

reg a;
reg b;
reg bin;
wire diff;
wire bout;

subtractor dut(
  .a(a),
  .b(b),
  .bin(bin),
  .diff(diff),
  .bout(bout)
);

initial begin 
  $dumpfile("build/subtractor.vcd");
  $dumpvars(0, subtractor_tb);

  a = 1;
  b = 1;
  bin = 0;
  #10
  a = 0;
  b = 0;
  #10
  a = 1;
  b = 0;
  #10
  a = 0;
  b = 1;

  #10 $finish;
end

endmodule
