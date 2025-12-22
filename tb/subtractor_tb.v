module subtractor_tb ();

reg [7:0] a;
reg [7:0] b;
reg bin;
wire [7:0] diff;
wire bout;

subtractor8 dut(
  .a(a),
  .b(b),
  .bin(bin),
  .diff(diff),
  .bout(bout)
);

initial begin 
  $dumpfile("build/subtractor.vcd");
  $dumpvars(0, subtractor_tb);

  a = 8'b00000001; b = 8'b00000001; bin = 0; #10; // 1 - 1
  a = 8'b00000010; b = 8'b00000001; bin = 0; #10; // 2 - 1
  a = 8'b00000001; b = 8'b00000010; bin = 0; #10; // borrow
  a = 8'b00001000; b = 8'b00000001; bin = 1; #10; // with bin
  a = 8'b00000000; b = 8'b00000001; bin = 0; #10; // underflow

  #10 $finish;
end

endmodule
