////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////										
	//Salida 7
	//wires
	wire signed [9:0] wResultZ2_cp;
	wire wZ2Real_sign;
	wire signed [14:0] wZ2Real_cp;
	wire signed [14:0] wZ2Real_dcp;
	wire wZ62Imag_sign;
	wire signed [14:0] wZ62Imag_cp;
	
	//normalizar wZ2Real	
	signed_adder #(10) sum62(w62,carry62,wZ2Imag,~wZ6Real+1, 1'b0);
	assign wResult62 = {carry62,w62};		//normalizar wResult72 para numero complejo
	
	//Fase de muxes parte Real
	complement_data #10 complementDataS7(wZ2Real, wZ2Real_sign, wZ2Real_cp);
	Normalize #(10) normZ2Real (Clock,clkNorm,wZ2Real_cp,5'b01001,mantReal6,expoReal6);
	descomplement_data #10 descomplement_dataS7(mantReal6, wZ2Real_sign, wZ2Real_dcp);	
	
	//Fase de muxes parte Imaginaria
	complement_data #10 complementDataS8(wResult62, wZ62Imag_sign, wZ62Imag_cp);
	Normalize #(10) norm62Imag (Clock,clkNorm,wZ62Imag_cp,5'b01001,mantImag6,expoImag6);
	descomplement_data #10 descomplement_dataS8(mantImag6, wZ62Imag_sign, wZ2Imag_dcp);	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Salida 8
	//wires
	wire signed [9:0] wResultZ71_cp;
	wire w71Real_sign;
	wire signed [14:0] wZ71Real_dcp;
	wire signed [14:0] wZ2Real_dcp;
	wire wZ3Real_sign;
	wire signed [14:0] wZ3Real_cp;
	wire signed [14:0] wZ3Real_dcp;
	wire w72Real_sign;
	wire signed [9:0] wResultZ72_cp;
	wire signed [14:0] wMantImag72_dcp;
	wire wZ3Imag_sign;
	wire signed [14:0] wZ3Imag_cp;
	wire signed [14:0] wZ3Imag_dcp;
	
	
	
	
	signed_adder #(10) sum71 (w71,carry71,wZ7Real,~wZ7Imag+1, 1'b0);
	assign wResult71 = {carry71,w71};									//wZ3Real + raiz(2)/2 * wResult71
	
	signed_adder #(10) sum72(w72,carry72,wZ7Real,wZ7Imag, 1'b0);
	assign wResult72 = {carry72,w72};									//wZ3Imag + raiz(2)/2 * wResult72	
		
	// Normalizacion para wResult71
	//Fase de muxes parte Real
	complement_data #10 complementDataS9(wResult71, w71Real_sign, wResultZ71_cp);
	Normalize #(10) norm71Real (Clock,clkNorm,wResultZ71_cp,5'b01001,mantReal71,expoReal71);
	
	float_multiplier mult71 (Clock,clkNorm,mantReal71,expoReal71,10'b0710071001,5'b71710,wMantReal71,wExpReal71);
	descomplement_data #10 descomplement_dataS8(wMantReal71, w71Real_sign, wZ71Real_dcp);	
	
	
	//Normalizacion para wZ3Real
	complement_data #10 complementDataS10(wZ3Real, wZ3Real_sign, wZ3Real_cp);
	Normalize #(10) normZ3Real (Clock,clkNorm,wZ3Real_cp,5'b01001,Z7mantReal71,Z7expReal71);
	descomplement_data #10 descomplement_dataS11(Z7mantReal71, wZ3Real_sign, wZ3Real_dcp);	
	
	
	float_adder sumador7Real(Clock,clkNorm,wZ71Real_dcp,Z7expReal71,wZ3Real_dcp,wExpReal71,mantReal7,expoReal7);
	
	//Fase de muxes parte Imaginaria
	complement_data #10 complementDataS11(wResult72, w72Real_sign, wResult72_cp);
	Normalize #(10) norm72Imag (Clock,clkNorm,wResult72,5'b01001,mantImag72,expoImag72);
	
	float_multiplier mult72 (Clock,clkNorm,mantImag72,expoImag72,10'b0710071001,5'b71710,wMantImag72,wExpImag72);
	descomplement_data #10 descomplement_dataS12(wMantImag72, w72Real_sign, wMantImag72_dcp);	
	
	//Normalizacion para wZ3Imag
	complement_data #10 complementDataS13(wZ3Imag, wZ3Imag_sign, wZ3Imag_cp);
	Normalize #(10) normZ3Imag (Clock,clkNorm,wZ3Imag_cp,5'b01001,Z7mantImag72,Z7expImag72);
	descomplement_data #10 descomplement_dataS14(Z7mantImag72, wZ3Imag_sign, wZ3Imag_dcp);	
	
	float_adder sumador7Imag(Clock, clkNorm,wZ3Imag_dcp,Z7expImag72,wMantImag72_dcp,wExpImag72,mantImag7,expoImag7);
	
	
