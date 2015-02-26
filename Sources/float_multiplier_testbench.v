`include "float_multiplier.v"
`include "Normalize.v"
`include "pruebaNormalizacion.v"
`include "mux2.v"


module tester();
//% This module is for testing the float_multiplier module with some samples. 
//% By the way I hardly recommend to do not change the name of this module, even if it is confused and problematic.
	reg clkExt, clkNorm;
	reg [9:0] iMant1, iMant2;
	reg [4:0] iExp1, iExp2;
	wire [14:0] oMantR;
	wire [4:0] oExpR;
	
	float_multiplier mult1(clkExt, clkNorm, iMant1, iExp1, iMant2, iExp2, oMantR, oExpR);
	
	initial begin
		clkExt = 0;
		clkNorm = 0;
		iExp1 = 5'b11101;
		iExp2 = 5'b00011;
		iMant1 = 10'b0111011100;
		iMant2 = 10'b0100010000;
	end 
	
	always begin
				#1 clkNorm = ~clkNorm;
			end
	
	always begin
				#20 clkExt = ~clkExt;
			end
	
	always begin
				#40 iMant1 = iMant1 + 3;
					iMant2 = iMant2 + 1;
			end
	
	initial #200 $finish;
	
	initial
		begin
			$monitor($time, "  iExp1 = %b, iMant1 = %b, iExp2 = %b, iMant2 = %b, Resultado: %b x2 %b", iExp1, iMant1, iExp2, iMant2, oMantR, oExpR );
			$dumpfile("float_multiplier_testbench.vcd");
			$dumpvars;
		end
	


endmodule
