//module signed_adder # ( parameter SIZE=8 ) (sum,overflow,a,b);
module signed_adder # ( parameter SIZE=8 ) (sum,cout,a,b,cin);
/*! This is a sign_adder with an overflow output.
* The overflow is the  fifth bit of the sum and is equivalent to the carry out.  
* (Carry out and overflow are not equivalent for signed adders.)  
* In the examples in this section the addition operator is used, in the
* following sections of this set adders will be constructed from
* primitive gates. http://www.ece.lsu.edu/ee3755/2012f/l05.v.html
*/
   input [SIZE-1:0] a, b;
   output [SIZE-1:0] sum;
   //output       overflow;
   
   input cin;
   output cout;

   //assign sum = a + b;
   assign {cout,sum} = a + b + cin;

   wire   sa = a[SIZE-1];
   wire   sb = b[SIZE-1];
   wire   ssum = sum[SIZE-1];

   //assign overflow = sa != sb   ? 0 :
     //                sb == ssum ? 0 : 1;

endmodule
