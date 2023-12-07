// Perform addition and substraction 

 module full_adder(cin, A, B, Sum, Cout);
  input A, B, cin;
  output Sum, Cout;
  assign Sum = A ^ B ^ cin;
  assign Cout = (A & B) | (A & cin) | (B & cin);
endmodule

module four_bit_adder(s, a0, a1, r, cout);
  input [3:0] a0, a1;
  input s;
  output [3:0] r;
  output cout;
  wire [3:1] carry;

 wire x1, x2, x3, x4;
 
 xor (x1, s, a1[0]);
 xor (x2, s, a1[1]);
 xor (x3, s, a1[2]);
 xor (x4, s, a1[3]);
 
  full_adder fa0(s, a0[0], x1, r[0], carry[1]);
  full_adder fa1(carry[1], a0[1], x2, r[1], carry[2]);
  full_adder fa2(carry[2], a0[2], x3, r[2], carry[3]);
  full_adder fa3(carry[3], a0[3], x4, r[3], cout);

endmodule

  module seven_segment_decoder (
  input [3:0] a,
  output [6:0] sw
);

assign sw[0]= ~a[3]& ~a[2] & ~a[1] & a[0] | ~a[3]& a[2] & ~a[1] & ~a[0] | a[3]& ~a[2] & a[1] & a[0] | a[3]& a[2] & ~a[1] & a[0];
assign sw[1]= ~a[3]& a[2] & ~a[1] & a[0] |  a[2] & a[1] & ~a[0] | a[3]& a[1] & a[0] | a[3]& a[2] & ~a[0];
assign sw[2]= ~a[3]& ~a[2] & a[1] & ~a[0] | a[3]& a[2] & a[1] | a[3]& a[2] & ~a[0]; 	
assign sw[3]=  (~a[3]& ~a[2] & ~a[1] & a[0]) | (~a[3]& a[2] & ~a[1] & ~a[0]) | (a[2] & a[1] & a[0]) | (a[3]& ~a[2] & a[1] & ~a[0]);
assign sw[4]= (~a[3]& ~a[2] & ~a[1] & a[0]) |( ~a[3]& ~a[2] & a[1] & a[0]) | (~a[3]& a[2] & ~a[1] & ~a[0] )| (~a[3]& a[2] & ~a[1] & a[0]) | (~a[3]& a[2] & a[1] & a[0]) | (a[3]& ~a[2] & ~a[1] & a[0]) ;
assign sw[5]= ~a[3]& ~a[2] & a[0] | ~a[3]& ~a[2] & a[1] | ~a[3]& a[1] & a[0] | a[3]& a[2] & ~a[1] & a[0];
assign sw[6]= ~a[3]& ~a[2] & ~a[1] | ~a[3]& a[2] & a[1] & a[0] | a[3]& a[2] & ~a[1] & ~a[0];

endmodule
