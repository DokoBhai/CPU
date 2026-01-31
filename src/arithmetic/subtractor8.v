module subtractor8 (
  input wire [7:0] a,
  input wire [7:0] b,
  input wire bin,
  output wire [7:0] diff,
  output wire bout
);

  wire bc0, bc1, bc2, bc3, bc4, bc5, bc6;

  subtractor fa0(a[0], b[0], bin, diff[0], bc0);
  subtractor fa1(a[1], b[1], bc0, diff[1], bc1);
  subtractor fa2(a[2], b[2], bc1, diff[2], bc2);
  subtractor fa3(a[3], b[3], bc2, diff[3], bc3);
  subtractor fa4(a[4], b[4], bc3, diff[4], bc4);
  subtractor fa5(a[5], b[5], bc4, diff[5], bc5);
  subtractor fa6(a[6], b[6], bc5, diff[6], bc6);
  subtractor fa7(a[7], b[7], bc6, diff[7], bout);

endmodule
