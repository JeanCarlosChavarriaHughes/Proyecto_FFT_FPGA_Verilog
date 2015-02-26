
	//Salida 5
	
	wire signed [9:0] mantReal4_cp, wResult41_cp;
	wire signed [9:0] mantImag4_cp, wResult42_cp;
	wire wResult41_sign, wResult42_sign;
	
	signed_adder #(10) sum41 (w41,carry41,wZ0Real,~wZ4Real+1, 1'b0);
	assign wResult41 = {carry41,w41};		
	
	signed_adder #(10) sum42(w42,carry42,wZ0Imag,~wZ4Imag+1, 1'b0);
	assign wResult42 = {carry42,w42};		
	
	//Fase de muxes parte Real
	complement_data #10 complementData41(wResult41, wResult41_sign, wResult41_cp);
	Normalize #(10) norm41Real (Clock,clkNorm,wResult41_cp,5'b01001,mantReal4_cp,expoReal4);
	descomplement_data #10 descomplement_data41(mantReal4_cp, wResult41_sign, mantReal4);
	
	//Fase de muxes parte Imaginaria
	complement_data #10 complementData42(wResult42, wResult42_sign, wResult42_cp);
	Normalize #(10) norm42Imag (Clock,clkNorm,wResult42_cp,5'b01001,mantImag4_cp,expoImag4);
	descomplement_data #10 descomplement_data42(mantImag4_cp, wResult42_sign, mantReal4);
	
	
	//Salida 6
	//wires
	wire signed [9:0] wResult51, wResult51_cp;
	wire wResult51_sign;
	wire signed [14:0] wMantReal51,wMantReal51_dcp;
	wire signed [14:0] Z5mantReal51_cp;
	wire signed [14:0] Z5mantReal51_dcp;
	wire wZ1Real_sign;
	
	wire signed [4:0] wExpReal51, Z5expReal51;
	
	signed_adder #(10) sum51 (w51,carry51,wZ5Real,wZ5Imag, 1'b0);		//wZ1Real - raiz(2)/2 * wResult51
	assign wResult51 = {carry51,w51};									//wZ1Imag - raiz(2)/2 * wResult51
	
	// Normalizacion para wResult51
	//Fase de muxes parte Real
	complement_data #10 complementData51(wResult51, wResult51_sign, wResult51_cp);
	Normalize #(10) norm51Real (Clock,clkNorm,wResult51_cp,5'b01001,mantReal51,expoReal51);
	
	
	float_multiplier mult51 (Clock,clkNorm,mantReal51,expoReal51,10'b0110011001,5'b11110,wMantReal51,wExpReal51);
	descomplement_data #10 descomplement_data51(wMantReal51, wResult51_sign, wMantReal51_dcp);
	
	//Normalizacion para wZ1Real
	
	Normalize #(10) normZ1Real (Clock,clkNorm,wZ1Real_cp,5'b01001,Z5mantReal51_cp,Z5expReal51);
	descomplement_data #10 descomplement_data52(Z5mantReal51_cp, wZ1Real_sign, Z5mantReal51_dcp);
	
	float_adder sumador5Real(Clock,clkNorm,Z5mantReal51_dcp,Z5expReal51,(~wMantReal51_dcp+1),wExpReal51,mantReal5,expoReal5);

	
