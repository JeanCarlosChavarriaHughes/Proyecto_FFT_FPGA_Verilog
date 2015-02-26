module float_adder(
	//%This module is a float adder, it recieves two inputs, two operands by mantisa and exponent part and it computes the addition.
	input clcExt,//Reloj lento
	input clkNorm,//Reloj interno, rapido
	input signed [14:0]  iMant1,//Mantisas de entrada son de 15 bits y los exponentes de 5 bits
	input signed [4:0] iExp1,
	input signed [14:0] iMant2,
	input signed [4:0] iExp2,
	output [14:0] oMantR,
	output [4:0] oExpR
	);
	
	reg [14:0] Mant3;
	
	reg [15:0] MantisaPre;
	wire [15:0] MantisaPre_cp;
	reg [4:0] ExpPre;
	

	//reg [10:0] MantisaMux;
	//reg [4:0] ExpMux;
	
	wire signed [15:0] q1, q3, q3_dcp;
	wire signed [4:0] q2, q4;
	
	always @(*) begin
	//Operación de la suma
		if(iExp1 > iExp2)
			begin
				Mant3 = iMant2 >> (iExp1 - iExp2);
				{MantisaPre[15],MantisaPre[14:0]} = Mant3 + iMant1;
				//assign MantisaPre = Mant3 + iMant1;
				ExpPre = iExp1;
			end
		else
			begin
				Mant3 = iMant1 >> (iExp2 - iExp1);
				//assign MantisaPre = Mant3 + iMant2;
				{MantisaPre[15],MantisaPre[14:0]} = Mant3 + iMant2;
				ExpPre = iExp2;
			end
	end
	
	//Conexión del renormalizador
	complement_data #16 complementData51(MantisaPre, Mantisa_sign, MantisaPre_cp);
	Normalize #(16) renormalize(clcExt,clkNorm,MantisaPre_cp,ExpPre,q3,q4);
	descomplement_data #16 descomp1(q3, Mantisa_sign, q3_dcp);
	
	assign oMantR = q3_dcp[15:1];
	assign oExpR = q4;

endmodule
