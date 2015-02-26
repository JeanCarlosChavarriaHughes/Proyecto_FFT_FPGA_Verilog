module float_multiplier
//% This module is a float multiplier calculator. It recieves two clocks, two operands by mantisa and exponent part and computes the producs.
	(
	input clkExt,
	input clkNorm,
	input signed [9:0] iMant1,//Mantisas de entrada son de 10 bits y los exponentes de 5 bits
	input signed [4:0] iExp1,
	input signed [9:0] iMant2,
	input signed [4:0] iExp2,
	output [14:0] oMantR,
	output [4:0] oExpR
	);
	
	wire signed [18:0] MantisaPre;
	wire signed [4:0] ExpPre;
		
	wire signed [18:0]q1, q3;
	wire signed [4:0]q2, q4;
	
	//Operación de la multiplicación
	assign MantisaPre = iMant1*iMant2;
	assign ExpPre = iExp1 + iExp2;
	
	
	//Conexión del renormalizador
	Normalize #19 reNormalize (clkExt,clkNorm,MantisaPre,ExpPre,q3,q4);
	
	assign oMantR = q3[18:4];
	assign oExpR = q4;

endmodule
