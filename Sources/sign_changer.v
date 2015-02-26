module complement_data # (parameter SIZE=8) (a,sign,b);
//% This module passes from normal data (without been complemented previously) to complemented data
   input [SIZE-1:0] a;
   output [SIZE-1:0] b;
   output sign;
   
   assign b = (a[SIZE-1]) ? (~a+1'b1) :a;
   assign sign = a[SIZE-1];
	
endmodule

module descomplement_data # (parameter SIZE=8) (a,signAnt,b);
//% This module passes from complemented data non-complemented data
   input [SIZE-1:0] a;
   input signAnt;
   output [SIZE-1:0] b;
   
   //Si signAnt es uno quiere decir que era negativo y complementa
   assign b = (signAnt) ? (~a+1'b1) :a;
  
endmodule
