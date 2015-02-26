`timescale 1ns/100ps
`include "signed_adder.v"
`include "Collaterals.v"
`include "clock.v"
`include "float_adder.v"
`include "float_multiplier.v"
`include "Normalize.v"
`include "mux2.v"
`include "pruebaNormalizacion.v"
`include "sign_changer.v"

//Se crea el modulo principal
module FFT_Calculator(iSamples0, iSamples1, iSamples2, iSamples3, iSamples4, iSamples5, iSamples6, iSamples7, oResult0, oResult1, oResult3, oResult4, oResult5, oResult6, oResult7, oResult8, oResult9, oResult10, oResult11, oResult12, oResult13, oResult14, oResult15,  Clock, clkNorm, Reset, clkNorm);
/*! Wow, finally, this is the end-up module where all the submodule are called and connected by using wires and registers.
*	Basically this module aims to connect all the phases of the butterfly structure as it was explained in the papers and lectures. 
*/
//Inputs
	input [7:0] iSamples0;
	input [7:0] iSamples1;
	input [7:0] iSamples2;
	input [7:0] iSamples3;
	input [7:0] iSamples4;
	input [7:0] iSamples5;
	input [7:0] iSamples6;
	input [7:0] iSamples7;

	//input [63:0] iSamples[7:0][7:0];
	input Clock, Reset, clkNorm;
//Outputs
	output [19:0] oResult0;
	output [19:0] oResult1;
	output [19:0] oResult2;
	output [19:0] oResult3;
	output [19:0] oResult4;
	output [19:0] oResult5;
	output [19:0] oResult6;
	output [19:0] oResult7;
	output [19:0] oResult8;
	output [19:0] oResult9;
	output [19:0] oResult10;
	output [19:0] oResult11;
	output [19:0] oResult12;
	output [19:0] oResult13;
	output [19:0] oResult14;
	output [19:0] oResult15;

//Wires
	wire [7:0] wSamples[7:0];
	wire signed [7:0] wL0;
	wire signed [7:0] wL1;
	//wire wOverflow1;
	wire signed [7:0] wL2;
	//wire wOverflow2;
	wire signed [7:0] wL3;
	//wire wOverflow3;
	wire signed [7:0] wL4;
	//wire wOverflow4;
	wire signed [7:0] wL5;
	//wire wOverflow5;
	wire signed [7:0] wL6;
	//wire wOverflow6;
	wire signed [7:0] wL7;
	//wire wOverflow7;
	wire [7:0] wCarryOutFS;
	
//Wire para Second Stage
	wire signed [8:0]wW0;
	wire signed [8:0]wW1;
	wire signed [8:0]wW2;
	wire signed [8:0]wW3;
	wire signed [8:0]wW4;
	wire signed [8:0]wW5;
	wire signed [8:0]wW6;
	wire signed [8:0]wW7;
	wire [7:0] wCarryOutSS;
	
	wire signed [8:0]wZ0;
	wire signed [8:0]wZ1;
	wire signed [8:0]wZ2;
	wire signed [8:0]wZ3;
	wire signed [8:0]wZ4;
	wire signed [8:0]wZ5;
	wire signed [8:0]wZ6;
	wire signed [8:0]wZ7;
	
//Wire para Third Stage
	wire signed [9:0]wZ0Real;
	wire signed [9:0]wZ0Imag;
	wire signed [9:0]wZ1Real;
	wire signed [9:0]wZ1Imag;
	wire signed [9:0]wZ2Real;
	wire signed [9:0]wZ2Imag;
	wire signed [9:0]wZ3Real;
	wire signed [9:0]wZ3Imag;
	wire signed [9:0]wZ4Real;
	wire signed [9:0]wZ4Imag;
	wire signed [9:0]wZ5Real;
	wire signed [9:0]wZ5Imag;
	wire signed [9:0]wZ6Real;
	wire signed [9:0]wZ6Imag;
	wire signed [9:0]wZ7Real;
	wire signed [9:0]wZ7Imag;
	

FFD_POSEDGE_SYNCRONOUS_RESET #(8) FFInputs1(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iSamples0),
	.Q(wSamples[0])
);

FFD_POSEDGE_SYNCRONOUS_RESET #(8) FFInputs2(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iSamples1),
	.Q(wSamples[1])
);	
	
FFD_POSEDGE_SYNCRONOUS_RESET #(8) FFInputs3(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iSamples2),
	.Q(wSamples[2])
);

FFD_POSEDGE_SYNCRONOUS_RESET #(8) FFInputs4(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iSamples3),
	.Q(wSamples[3])
);	
	
FFD_POSEDGE_SYNCRONOUS_RESET #(8) FFInputs5(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iSamples4),
	.Q(wSamples[4])
);

FFD_POSEDGE_SYNCRONOUS_RESET #(8) FFInputs6(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iSamples5),
	.Q(wSamples[5])
);

FFD_POSEDGE_SYNCRONOUS_RESET #(8) FFInputs7(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iSamples6),
	.Q(wSamples[6])
);

FFD_POSEDGE_SYNCRONOUS_RESET #(8) FFInputs8(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iSamples7),
	.Q(wSamples[7])
);
//First stage

	//	assign {wOverFlow,wL1} = iSamples0 + iSamples[4];
	//Signed subtraction
	// A - B = A + (-B)
		//-B = ~B + 1

//Preguntar al profe si verilog soporta que un argumento a
	//Una funcion sea otra operacion, sino corregir.
	//Ln es en la imagen Wn
	signed_adder #(8) Sum1 (wL0,wCarryOutFS[0],wSamples[0],wSamples[4], 1'b0);
	assign wW0 = {wCarryOutFS[0],wL0}; //Concatenación  
	signed_adder #(8) Sum2 (wL1,wCarryOutFS[1],wSamples[0],~wSamples[4] + 1'b1, 1'b0);
	assign wW1 = {wCarryOutFS[1],wL1};
	
	signed_adder #(8) Sum3 (wL2,wCarryOutFS[2],wSamples[2],wSamples[6], 1'b0);
	assign wW2 = {wCarryOutFS[2],wL2};
	signed_adder #(8) Sum4 (wL3,wCarryOutFS[3],wSamples[2],~wSamples[6] + 1'b1, 1'b0);
	assign wW3 = {wCarryOutFS[3],wL3};
	
	signed_adder #(8) Sum5 (wL4,wCarryOutFS[4],wSamples[1],wSamples[5], 1'b0);
	assign wW4 = {wCarryOutFS[4],wL4};
	signed_adder #(8) Sum6 (wL5,wCarryOutFS[5],wSamples[1],~wSamples[5] + 1'b1, 1'b0);
	assign wW5 = {wCarryOutFS[5],wL5};
	
	signed_adder #(8) Sum7 (wL6,wCarryOutFS[6],wSamples[3],wSamples[7], 1'b0);
	assign wW6 = {wCarryOutFS[6],wL6};
	signed_adder #(8) Sum8 (wL7,wCarryOutFS[7],wSamples[3],~wSamples[7] + 1'b1, 1'b0);
	assign wW7 = {wCarryOutFS[7],wL7};
	
//Second Stage
	
	signed_adder #(9) Sum20 (wZ0,wCarryOutSS[0],wW0,wW2, 1'b0);
	assign wZ0Real = {wCarryOutSS[0],wZ0};
	assign wZ0Imag = 10'b0000000000;
	
	assign wZ1Real = {wW1[8],wW1};
	assign wZ1 = ~wW3+1;
	assign wZ1Imag = {wZ1[8],wZ1};
	
	signed_adder #(9) Sum22 (wZ2,wCarryOutSS[2],wW0,~wW2+1'b1, 1'b0);
	assign wZ2Real = {wCarryOutSS[2],wZ2};
	assign wZ2Imag = 10'b0000000000;
	
	assign wZ3Real = {wW1[8],wW1};
	assign wZ3Imag = {wW3[8],wW3};
	
	signed_adder #(9) Sum24 (wZ4,wCarryOutSS[4],wW4,wW6, 1'b0);
	assign wZ4Real = {wCarryOutSS[4],wZ4};
	assign wZ4Imag = 10'b0000000000;
	
	assign wZ5Real = {wW5[8],wW5};
	assign wZ5 = ~wW7+1;
	assign wZ5Imag = {wZ5[8],wZ5};
	
	signed_adder #(9) Sum26 (wZ6,wCarryOutSS[6],wW4,~wW6+1'b1, 1'b0);
	assign wZ6Real = {wCarryOutSS[6],wZ6};
	assign wZ6Imag = 10'b0000000000;
	
	assign wZ7Real = {wW5[8],wW5};
	assign wZ7Imag = {wW7[8],wW7};
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//Fase 4, numero flotante
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	wire signed [9:0] w01, w02, wResult01;
	wire signed [9:0] mantReal0, mantImag0;
	wire signed [4:0] expoReal0, expoImag0;
	//Salida 1
	//para abiel
	//Dado que la salida 1 es unicamente numeros reales sale directo.
	signed_adder #(10) sum01 (w01,carry01,wZ0Real,wZ4Real, 1'b0);
	assign wResult01 = {carry01,w01};
	
	signed_adder #(10) sum02(w02,carry02,wZ0Imag,wZ4Imag, 1'b0);
	assign wResult02 = {carry02,w02};
	

	//Fase de muxes parte Real
	//Normalize #(10) norm0real (Clock,clkNorm,wResult01,5'b0,mantReal0,expoReal0);
	Normalize #(10) norm0real (Clock,clkNorm,wResult01,5'd9,mantReal0,expoReal0);
	
	//Fase de muxes parte Imaginaria
	//Normalize #(10) norm0imag (Clock,clkNorm,wResult02,5'b0,mantImag0,expoImag0);
	
	//Normalize #(10) norm0imag (Clock,clkNorm,wResult02,5'd9,mantImag0,expoImag0);
	assign mantImag0 = 15'b0;
	assign expoImag0 = 5'b0;

	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//Salida 2
	//wires
	wire signed [9:0] w11, w12, wResult11, wResult12;
	wire signed [9:0] mantReal1, mantImag1;
	wire signed [4:0] expoReal1, expoImag1, expoReal11, wExpReal11, Z1expReal11;
	wire signed [9:0] wResult11_cp;
	wire wResult11_sign;
	wire signed [14:0] wMantReal11, wMantReal11_dcp;
	wire signed [9:0] Z1mantReal11;
	wire signed [9:0] wZ1Real_cp;
	wire signed [9:0] wZ1Real_dcp;
	wire wZ1Real_sign;
	wire signed [9:0] mantReal11;

	signed_adder #(10) sum11 (w11,carry11,wZ5Real,~wZ5Imag+1'b1, 1'b0);
	assign wResult11 = {carry11,w11};	//wZ1Real + raiz(2)/2 * wResult11
	
	signed_adder #(10) sum12(w12,carry12,wZ5Imag,~wZ5Real+1'b1, 1'b0);
	assign wResult12 = {carry02,w12};	//wZ1Imag + raiz(2)/2 * wResult12
	
	// Normalizacion para wResult11
	//Fase de muxes parte Real
	//Aqui hay un problema porque le llegan valores negativos a normalizador
	complement_data #10 complementData1(wResult11, wResult11_sign, wResult11_cp);
	Normalize #(10) norm11real (Clock,clkNorm,wResult11_cp,5'b01001,mantReal11,expoReal11);
	
	float_multiplier mult11 (Clock,clkNorm,mantReal11,expoReal11,10'b0110011001,5'b11110,wMantReal11,wExpReal11);
	descomplement_data #(15) descomplement_data1(wMantReal11, wResult11_sign, wMantReal11_dcp);

	//Normalizacion para wZ1Real
	complement_data #(10) complementData1r(wZ1Real, wZ1Real_sign, wZ1Real_cp);

	Normalize #(10) normZ1real (Clock,clkNorm,wZ1Real_cp,5'b01001,Z1mantReal11,Z1expReal11);

	descomplement_data #(10) descomplement_data1r(Z1mantReal11, wZ1Real_sign, wZ1Real_dcp);	
	
	float_adder sumador1Real(Clock, clkNorm,wMantReal11_dcp,wExpReal11,wZ1Real_dcp,Z1expReal11,mantReal1,expoReal1);
	
	// Normalizacion para wResult11
	//Fase de muxes parte Imaginaria
	//wires  
	wire signed [9:0] wResult12_cp;
	wire wResult12_sign;
	wire signed [14:0] wMantImag12_dcp;
	//wire signed [9:0]  wZ1Real_cp;
	//wire wZ1Real_sign;
	wire signed [14:0] Z1mantImag12_dcp;


	complement_data #(10) complementData1i(wResult12, wResult12_sign, wResult12_cp);	

	Normalize #(10) norm12Imag (Clock,clkNorm,wResult12_cp,5'b01001,mantImag12,expoImag12);

	float_multiplier mult12 (Clock,clkNorm,mantImag12,expoImag12,10'b0110011001,5'b11110,wMantImag12,wExpImag12);

	descomplement_data #(10) descomplement_data1i(wMantImag12, wResult12_sign, wMantImag12_dcp);	
	
	//Normalizacion para wZ1Imag
	complement_data #(10) complementData1ii(wZ1Imag, wZ1Real_sign, wZ1Imag_cp);

	Normalize #(10) normZ1Imag (Clock,clkNorm,wZ1Imag_cp,5'b01001,Z1mantImag12,Z1expImag12);
	
	descomplement_data #10 descomplement_data1ii(Z1mantImag12, wZ1Real_sign, Z1mantImag12_dcp);	

	float_adder sumador1Imag(Clock,clkNorm,Z1mantImag12_dcp,Z1expImag12,wMantImag12,wExpImag12,mantImag1,expoImag1);
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Salida 3
	//normalizar wZ2Real
	wire signed [9:0] w21,wResult21;
	wire signed [9:0] mantReal2, mantImag2;
	wire signed [4:0] expoReal2, expoImag2;
	
	signed_adder #(10) sum21 (w21,carry21,wZ2Imag,wZ6Real, 1'b0);
	assign wResult21 = {carry21,w21};

	//wires
	wire signed [9:0] wZ2Real_cp;
	wire wZ2Real_sign;
	wire signed [9:0] mantReal2_dcp;
	wire signed [9:0] wResult21_cp;
	wire wResult21_sign;
	wire signed [9:0] mantImag2_dcp;

	complement_data #10 complementData2r(wZ2Real, wZ2Real_sign, wZ2Real_cp);
	//Normalizacion de wZ2Real (parte real)
	Normalize #(10) norm2Real (Clock,clkNorm,wZ2Real_cp,5'b01001,mantReal2,expoReal2);
	
	descomplement_data #10 descomplement_data2r(mantReal2, wZ2Real_sign, mantReal2_dcp);	

	//Normalizacion de parte imaginaria
	complement_data #10 complementData2i(wResult21, wResult21_sign, wResult21_cp);

	Normalize #(10) norm2Imag (Clock,clkNorm,wResult21_cp,5'b01001,mantImag2,expoImag2);
	
	descomplement_data #10 descomplement_data2i(mantImag2, wResult21_sign, mantImag2_dcp);	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Salida 4
	wire signed [9:0] w31, w32, wResult31, wResult32;
	wire signed [9:0] mantReal3, mantImag3;
	wire signed [4:0] expoReal3, expoImag3;
	
	signed_adder #(10) sum31 (w31,carry31,wZ7Imag,~wZ7Real+1, 1'b0);
	assign wResult31 = {carry31,w31};			//wZ3Real + raiz(2)/2 * wResult31
	
	signed_adder #(10) sum32(w32,carry32,wZ7Imag,wZ7Real, 1'b0);
	assign wResult32 = {carry32,w32};			//wZ3Imag - raiz(2)/2 * wResult32
	
	//wires
	wire wResult31_sign;
	wire signed [9:0] wResult31_cp;
	wire signed [14:0] wMantReal31_dcp;
	wire wZ3Real_sign;
	wire signed [9:0] wZ3Real_cp;
	wire signed [9:0] Z3mantReal31_dcp;
	wire signed [9:0]  wResult32_cp;
	wire wResult32_sign;
	wire signed [14:0] wMantImag32_dcp;
	wire wZ3Imag_sign;
	wire signed [9:0] wZ3Imag_cp;
	wire signed [9:0] Z3mantImag32_dcp;

	// Normalizacion para wResult31
	complement_data #10 complementData3r(wResult31, wResult31_sign, wResult31_cp);

	Normalize #(10) norm31Real (Clock,clkNorm,wResult31_cp,5'b01001,mantReal31,expoReal31);
	
	float_multiplier mult31 (Clock,clkNorm,mantReal31,expoReal31,10'b0110011001,5'b11110,wMantReal31,wExpReal31);
	
	descomplement_data #10 descomplement_data3r(wMantReal31, wMantReal31_sign, wMantReal31_dcp);	

	//Normalizacion para wZ3Real
	complement_data #10 complementData3i(wZ3Real, wZ3Real_sign, wZ3Real_cp);

	Normalize #(10) normZ3Real (Clock,clkNorm,wZ3Real_cp,5'b01001,Z3mantReal31,Z3expReal31);
	
	descomplement_data #10 descomplement_data3i(Z3mantReal31, wZ3Real_sign, Z3mantReal31_dcp);	

	float_adder sumador3Real(Clock,clkNorm,Z3mantReal31_dcp,Z3expReal31,wMantReal31_dcp,wExpReal31,mantReal3,expoReal3);
	
	//Fase de muxes parte ImaginariawMantImag32_dcp
	complement_data #10 complementData3ii(wResult32, wResult32_sign, wResult32_cp);

	Normalize #(10) norm32Imag (Clock,clkNorm,wResult32_cp,5'b01001,mantImag32,expoImag32);
	
	float_multiplier mult32 (Clock,clkNorm,mantImag32,expoImag32,10'b0110011001,5'b11110,wMantImag32,wExpImag32);
	
	descomplement_data #10 descomplement_data3ii(wMantImag32, wResult32_sign, wMantImag32_dcp);	
	
	//Normalizacion para wZ3Imag
	complement_data #10 complementData3iii(wZ3Imag, wZ3Imag_sign, wZ3Imag_cp);

	Normalize #(10) normZ3Imag (Clock,clkNorm,wZ3Imag_cp,5'b01001,Z3mantImag32,Z3expImag32);
	
	descomplement_data #10 descomplement_data3iii(Z3mantImag32, wZ3Imag_sign, Z3mantImag32_dcp);	

	float_adder sumador3Imag(Clock, clkNorm,Z3mantImag32_dcp,Z3expImag32,(~wMantImag32_dcp+1),wExpImag32,mantImag3,expoImag3);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//Salida 5
	
	//wires
	wire signed [9:0] w41, w42, wResult41, wResult42;
	wire signed [9:0] mantReal4, mantImag4;
	wire signed [4:0] expoReal4, expoImag4;
	
	wire signed [9:0] mantReal4_cp, wResult41_cp;
	wire signed [9:0] mantImag4_cp, wResult42_cp;
	wire wResult41_sign, wResult42_sign;
	
	signed_adder #(10) sum41 (w41,carry41,wZ0Real,~wZ4Real+1'b1, 1'b0);
	assign wResult41 = {carry41,w41};		
	
	signed_adder #(10) sum42(w42,carry42,wZ0Imag,~wZ4Imag+1'b1, 1'b0);
	assign wResult42 = {carry42,w42};		
	
	//Fase de muxes parte Real
	complement_data #10 complementData41(wResult41, wResult41_sign, wResult41_cp);
	Normalize #(10) norm41Real (Clock,clkNorm,wResult41_cp,5'b01001,mantReal4_cp,expoReal4);
	descomplement_data #10 descomplement_data41(mantReal4_cp, wResult41_sign, mantReal4);
	
	//Fase de muxes parte Imaginaria
	complement_data #10 complementData42(wResult42, wResult42_sign, wResult42_cp);
	Normalize #(10) norm42Imag (Clock,clkNorm,wResult42_cp,5'b01001,mantImag4_cp,expoImag4);
	descomplement_data #10 descomplement_data42(mantImag4_cp, wResult42_sign, mantImag4);

	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	//Salida 6
	//wires
	wire signed [9:0] w51, wResult51;
	wire signed [9:0] mantReal5, mantImag5;
	wire signed [4:0] expoReal5, expoImag5;
	
	wire signed [9:0] wResult51_cp;
	wire wResult51_sign;
	wire signed [14:0] wMantReal51,wMantReal51_dcp;
	wire signed [14:0] Z5mantReal51_cp;
	wire signed [14:0] Z5mantReal51_dcp;
	
	wire signed [4:0] wExpReal51, Z5expReal51;
	
	signed_adder #(10) sum51 (w51,carry51,wZ5Real,wZ5Imag, 1'b0);		//wZ1Real - raiz(2)/2 * wResult51
	assign wResult51 = {carry51,w51};									//wZ1Imag - raiz(2)/2 * wResult51
	
	// Normalizacion para wResult51
	//Fase de muxes parte Real
	complement_data #10 complementData51(wResult51, wResult51_sign, wResult51_cp);
	Normalize #(10) norm51Real (Clock,clkNorm,wResult51_cp,5'b01001,mantReal51,expoReal51);
	
	
	float_multiplier mult51 (Clock,clkNorm,mantReal51,expoReal51,10'b0110011001,5'b11110,wMantReal51,wExpReal51);
	descomplement_data #(15) descomplement_data51(wMantReal51, wResult51_sign, wMantReal51_dcp);
	
	//Normalizacion para wZ1Real
	complement_data #10 complementData51i(wZ1Real, wZ1Real_sign, wZ1Real_cp);
	Normalize #(10) normZ1Real (Clock,clkNorm,wZ1Real_cp,5'b01001,Z5mantReal51_cp,Z5expReal51);
	descomplement_data #(10) descomplement_data52(Z5mantReal51_cp, wZ1Real_sign, Z5mantReal51_dcp);
	
	float_adder sumador5Real(Clock,clkNorm,Z5mantReal51_dcp,Z5expReal51,(~wMantReal51_dcp+1),wExpReal51,mantReal5,expoReal5);

	//Fase de muxes parte Imaginaria
	
	//Normalizacion para wZ1Imag
	float_adder sumador5Imag(Clock,clkNorm,Z1mantImag12_dcp,Z1expImag12,(~wMantReal51_dcp+1),wExpReal51,mantImag5,expoImag5);
											
											
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////										
	//Salida 7
	//wires
	//wire signed [9:0] wResultZ2_cp;
	//wire wZ2Real_sign;
	//wire signed [14:0] wZ2Real_cp;
	//wire signed [14:0] wZ2Real_dcp;
	wire signed [9:0] w62, wResult62;
	wire signed [9:0] mantReal6, mantImag6;
	wire signed [4:0] expoReal6, expoImag6;
	
	wire wZ62Imag_sign;
	wire signed [14:0] wZ62Imag_cp;
	
	//normalizar wZ2Real	
	signed_adder #(10) sum62(w62,carry62,wZ2Imag,~wZ6Real+1'b1, 1'b0);
	assign wResult62 = {carry62,w62};		//normalizar wResult72 para numero complejo
	
	//Fase de muxes parte Real
	complement_data #10 complementDataS7(wZ2Real, wZ2Real_sign, wZ2Real_cp);
	Normalize #(10) normZ2Real (Clock,clkNorm,wZ2Real_cp,5'b01001,mantReal6,expoReal6);
	descomplement_data #10 descomplement_dataS7(mantReal6, wZ2Real_sign, wZ2Real_dcp);	
	
	//Fase de muxes parte Imaginaria
	complement_data #(10) complementDataS8(wResult62, wZ62Imag_sign, wZ62Imag_cp);
	Normalize #(10) norm62Imag (Clock,clkNorm,wZ62Imag_cp,5'b01001,mantImag6,expoImag6);
	descomplement_data #(15) descomplement_dataS8(mantImag6, wZ62Imag_sign, wZ2Imag_dcp);	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//Salida 8
	//wires
	wire signed [9:0] w71, w72, wResult71, wResult72;
	wire signed [14:0] mantReal7;
	wire signed [14:0] mantImag7;
	wire signed [4:0] expoReal7, expoImag7;
	
	wire signed [9:0] wResultZ71_cp;
	wire w71Real_sign;
	wire signed [14:0] wZ71Real_dcp;
//	wire wZ3Real_sign;
//	wire signed [14:0] wZ3Real_cp;
//	wire signed [14:0] wZ3Real_dcp;
	wire w72Real_sign;
	wire signed [9:0] wResultZ72_cp;
	wire signed [14:0] wMantImag72_dcp;
	//wire wZ3Imag_sign;
	wire signed [4:0] wExpImag72, expoImag72;
	wire signed [14:0] wZ3Imag_dcp;
//	wire signed [14:0] wZ3Imag_dcp;
	wire signed [4:0] Z7expImag72;
	wire signed [14:0] Z7mantImag72;
	wire signed [14:0] wMantImag72;
	
	
	
	
	signed_adder #(10) sum71 (w71,carry71,wZ7Real,~wZ7Imag+1'b1, 1'b0);
	assign wResult71 = {carry71,w71};									//wZ3Real + raiz(2)/2 * wResult71
	
	signed_adder #(10) sum72(w72,carry72,wZ7Real,wZ7Imag, 1'b0);
	assign wResult72 = {carry72,w72};									//wZ3Imag + raiz(2)/2 * wResult72	
		
	// Normalizacion para wResult71
	//Fase de muxes parte Real
	complement_data #10 complementDataS9(wResult71, w71Real_sign, wResultZ71_cp);
	Normalize #(10) norm71Real (Clock,clkNorm,wResultZ71_cp,5'b01001,mantReal71,expoReal71);
	
	float_multiplier mult71 (Clock,clkNorm,mantReal71,expoReal71,10'b0110011001,5'b11110,wMantReal71,wExpReal71);
	descomplement_data #10 descomplement_dataS8i(wMantReal71, w71Real_sign, wZ71Real_dcp);	
	
	
	//Normalizacion para wZ3Real
	complement_data #10 complementDataS10(wZ3Real, wZ3Real_sign, wZ3Real_cp);
	Normalize #(10) normZ3Reali (Clock,clkNorm,wZ3Real_cp,5'b01001,Z7mantReal71,Z7expReal71);
	descomplement_data #10 descomplement_dataS11(Z7mantReal71, wZ3Real_sign, wZ3Real_dcp);	
	
	
	float_adder sumador7Real(Clock,clkNorm,wZ71Real_dcp,Z7expReal71,wZ3Real_dcp,wExpReal71,mantReal7,expoReal7);
	
	//Fase de muxes parte Imaginaria
	complement_data #10 complementDataS11(wResult72, w72Real_sign, wResult72_cp);
	Normalize #(10) norm72Imag (Clock,clkNorm,wResult72,5'b01001,mantImag72,expoImag72);
	
	float_multiplier mult72 (Clock,clkNorm,mantImag72,expoImag72,10'b0110011001,5'b11110,wMantImag72,wExpImag72);
	descomplement_data #15 descomplement_dataS12(wMantImag72, w72Real_sign, wMantImag72_dcp);	
	
	//Normalizacion para wZ3Imag
	//complement es de 15 o de 10?
	complement_data #(10) complementDataS13(wZ3Imag, wZ3Imag_sign, wZ3Imag_cp);
	Normalize #(10) normZ3Imagi (Clock,clkNorm,wZ3Imag_cp,5'b01001,Z7mantImag72,Z7expImag72);
	descomplement_data #(10) descomplement_dataS14(Z7mantImag72, wZ3Imag_sign, wZ3Imag_dcp);	
	
	float_adder sumador7Imag(Clock, clkNorm,wZ3Imag_dcp,Z7expImag72,wMantImag72_dcp,wExpImag72,mantImag7,expoImag7);
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Concatenacion de salida de mantisa mas exponente para cada vector, salida de 20 bits.
	
	assign oResult0 = {mantReal0,5'b0,expoReal0};  
	assign oResult1 = {mantImag0,5'b0,expoImag0};
	assign oResult2 = {mantReal1,expoReal1};
	assign oResult3 = {mantImag1,expoImag1};
	assign oResult4 = {mantReal2,5'b0,expoReal2};
	assign oResult5 = {mantImag2,5'b0,expoImag2};
	assign oResult6 = {mantReal3,expoReal3};
	assign oResult7 = {mantImag3,expoImag3};
	assign oResult8 = {mantReal4,5'b0,expoReal4};
	assign oResult9 = {mantImag4,5'b0,expoImag4};
	assign oResult10 = {mantReal5,expoReal5};
	assign oResult11 = {mantImag5,expoImag5};
	assign oResult12 = {mantReal6,5'b0,expoReal6};
	assign oResult13 = {mantImag6,5'b0,expoImag6};
	assign oResult14 = {mantReal7,expoReal7};
	assign oResult15 = {mantImag7,expoImag7};
	
endmodule
