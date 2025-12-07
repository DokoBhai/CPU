module subtractor4 (
  input wire [3:0] a,
  input wire [3:0] b,
  input wire bin,
  output wire [3:0] diff,
  output wire bout
);

  wire bc0;
  wire bc1;
  wire bc2;

  subtractor fa0(a[0], b[0], bin, diff[0], bc0);
  subtractor fa1(a[1], b[1], bc0, diff[1], bc1 );
  subtractor fa2(a[2], b[2], bc1, diff[2], bc2);
  subtractor fa3(a[3], b[3], bc2, diff[3], bout);

endmodule
