module subtractor_tb ();

reg [3:0] a;
reg [3:0] b;
reg bin;
wire [3:0] diff;
wire bout;

subtractor4 dut(
  .a(a),
  .b(b),
  .bin(bin),
  .diff(diff),
  .bout(bout)
);

initial begin 
  $dumpfile("build/subtractor.vcd");
  $dumpvars(0, subtractor_tb);

  a = 4'b0001; b = 4'b0001; bin = 0; #10;
  a = 4'b0010; b = 4'b0001; bin = 0; #10;

  #10 $finish;
end

endmodule
