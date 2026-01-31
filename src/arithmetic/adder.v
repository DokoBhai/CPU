/*
This is the module used in adder8.v.
It only adds 2 single bits and has a carry output and carry input for adder8.v to be a full adder.
There are 3 inputs, cin, a, b used they all are added together to determine the outputs.
There are 2 outputs sum, carry these outputs are 1 bit. 
*/

module adder (
  input wire a, 
  input wire b,
  input wire cin,
  output wire sum,
  output wire carry
);

  assign sum = a ^ b ^ cin;
  assign carry = (a & b) | (cin & a) | (cin & b);

endmodule
