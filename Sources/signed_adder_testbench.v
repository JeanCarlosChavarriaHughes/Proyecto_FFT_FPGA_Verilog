`include "signed_adder.v"

//Test bench para el modulo signed_adder
module signed_adder_testbench; 
//% This module is for testing the behavior of signed_adder module with overflow output.
	
	//inputs
	input [7:0] sum;
	input cout;

	//outputs
	output reg [7:0] a;
	output reg [7:0] b;
	output reg cin;

	time simulationTime;

	//Instancia del modulo
	signed_adder #8 S1(sum, cout, a, b, cin);

	//generador de senales
	initial
		begin
			a = 8'hDE;
			b = 8'h01; 
			cin = 1'b0;
			$display("a=%h, b=%h, cin=%b", a, b, cin);
		end

	initial 
		#100 $finish;

	initial
		begin
			//$monitor($time, "a=%h, b=%h, cin=%b", a, b, cin);
			$monitor($time, "sum=%h, cout=%b, sum=%b", sum, cout, sum);
			$dumpfile("signed_adder_testbench.vcd");
			$dumpvars;

		end
endmodule
