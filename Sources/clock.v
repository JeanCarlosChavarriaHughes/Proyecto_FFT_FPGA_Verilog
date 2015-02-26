

module clock(clk);
//%This is the module that generates the clock signal.
//%The period of this clock can be modified.

	output clk;

	reg clk;

	initial
		#1 clk=0;

	always
		#5 clk=~clk;

endmodule


