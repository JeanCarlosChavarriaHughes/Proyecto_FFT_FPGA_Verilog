module Normalize # ( parameter SIZE=10 ) (Clock,clkNorm,iVect,iExp,oMant,oExp);
//% This module is the following step to the normalization phase.
	input Clock,clkNorm;
    input [SIZE-1:0] iVect;
    input [4:0] iExp;
    output [SIZE-1:0] oMant;
    output [4:0] oExp;
	
	wire [SIZE-1:0] reMantReal0, mantisaReal0;
	wire [4:0] reExpReal0, expReal0;
	//Fase de muxes parte Real
	mux2 #(SIZE) muxMantReal0(Clock,reMantReal0,iVect,mantisaReal0);
	mux2 #(5) muxExpoReal0(Clock,reExpReal0,iExp,expReal0);
	
	//fase de normalizacion parte Real
	normalizacion #(SIZE) normReal0 (clkNorm,mantisaReal0,expReal0,~Clock,reMantReal0,reExpReal0,oMant,oExp);
	

endmodule
