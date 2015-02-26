//q1: realimentacion de mantisa
//q2: realimentacion de exponente
//q3: salida de mantisa definitiva ya normalizada
//q4: salida de exponente definitiva ya normalizada
module normalizacion # ( parameter SIZE=10 ) (clkNorm, vect,exp,enable,q1,q2,q3,q4);
   //INPUTS NO PUEDEN SER REGISTROS
   //% This module is for preparing the data to be computed by additions, substractions, multiplications and divisions.
   //% This is a non-RTL module, but eventually it can be coded in RTL mode.
   input [SIZE-1:0] vect;
   input [4:0] exp;
   output reg [SIZE-1:0] q1,q3;
   output  reg [4:0] q2,q4;
   
   input clkNorm, enable;
   
   always @ (negedge clkNorm ) begin
	   if(enable) begin
			if(vect[SIZE-1]==0) begin
				q1 = (vect << 1);			//roto la mantisa a la izquierda
				q2=exp-1;
			end
			else begin
				q3 = (vect >> 1);			//roto la mantisa a la derecha y lo guardo en q3 que tiene el valor de la mantisa def.
				q4 = exp + 1'b1; 
			end
	   end
	end
endmodule
