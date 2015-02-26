`include "float_adder.v"
`include "Normalize.v"
`include "pruebaNormalizacion.v"
`include "mux2.v"
`include "sign_changer.v"

//Test bench para el modulo float_adder.v
module float_adder_testbench; 
//%This module is for testing the float_adder module with some relevant samples.
	
	//inputs
	input [14:0] oMantR;
	input [4:0] oExpR;

	//outputs
	output reg signed [14:0] iMant1;
	output reg signed [4:0] iExp1;
	output reg signed [14:0] iMant2;
	output reg signed [4:0] iExp2;

	//clock
	reg clk;
	reg clcext;

	initial 
		begin
			#0 clk=0;
			clcext = 1;
		end
	always
		#40 clcext= ~clcext;
		
	always
		#1 clk=~clk;
		

	time simulationTime;

	//Instancia del modulo
	float_adder F1(clcext, clk, iMant1, iExp1, iMant2, iExp2, oMantR, oExpR);

	//generador de senales
	initial
		begin
			iMant1 = 15'h10;
			iExp1 = 5'h01;
			iMant2 = 15'h10;
			iExp2 = 5'h00;
			$display("Valores Iniciales \n");
			$display("iMant1=%h, iExp1=%h, iMant2=%h, iExp2=%h", iMant1, iExp1, iMant2, iExp2);
			$display("Resultado: ");
		end
/*
	initial
		begin
			#41 iMant1 = iMant1 + 15'h01;
			iExp1 = iExp1 + 5'h01;
			iMant2 = iMant2 + 15'h01;
			iExp2 = iExp2 + 5'h00;
		end
*/
	initial
		#100 $finish;

	initial
		begin
			$monitor($time, "   oMantR=%h, oExpR=%h", oMantR, oExpR);
			$dumpfile("float_adder_testbench.vcd");
			$dumpvars;

		end
endmodule
