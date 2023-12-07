module seven segment decoder (a,b,c,d,sw0,sw1,sw2,sw3,sw4,sw5,sw6);
input a,b,c,d;
output sw0, sw1, sw2, sw3, sw4, sw5, sw6;
assign sw0= ~a & ~b & ~c & d | ~a & b & ~c & ~d | a & ~b & c & d | a & b & ~c & d;
assign sw1= ~a & b & ~c & d | b & c & ~d | a & c & d | a & b & ~d;
assign sw2= ~a & ~b & c & ~d | a & b & c | a & b & ~d; 
assign sw3= (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (b & c & d) | (a & ~b & c & ~d);
assign sw4= (~a & ~b & ~c & d) |( ~a & ~b & c & d) | (~a & b & ~c & ~d )| (~a & b & ~c & d) |
(~a & b & c & d) | (a & ~b & ~c & d) ;
assign sw5= ~a & ~b & d | ~a & ~b & c | ~a & c & d | a & b & ~c & d;
assign sw6= ~a & ~b & ~c | ~a & b & c & d | a & b & ~c & ~d;
endmodule
