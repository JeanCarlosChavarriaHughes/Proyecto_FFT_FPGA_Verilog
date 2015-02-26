`include "FTT_Calculator.v"


module calculator_testbench; 
//%Testbench for the FFT_Calculator module
	
	//output
	output reg [7:0] iSamples0;
	output reg [7:0] iSamples1;
	output reg [7:0] iSamples2;
	output reg [7:0] iSamples3;
	output reg [7:0] iSamples4;
	output reg [7:0] iSamples5;
	output reg [7:0] iSamples6;
	output reg [7:0] iSamples7;
	
	output reg Clock, Reset, clkNorm;
	
	//inputs
	input [19:0] oResult0 ;
	input [19:0] oResult1 ;
	input [19:0] oResult2 ;
	input [19:0] oResult3 ;
	input [19:0] oResult4 ;
	input [19:0] oResult5 ;
	input [19:0] oResult6 ;
	input [19:0] oResult7 ;
	input [19:0] oResult8 ;
	input [19:0] oResult9 ;
	input [19:0] oResult10 ;
	input [19:0] oResult11 ;
	input [19:0] oResult12 ;
	input [19:0] oResult13 ;
	input [19:0] oResult14 ;
	input [19:0] oResult15 ;

	initial 
		begin
			#0 Clock=0;
			clkNorm = 0;
		end
	always
		#40 Clock= ~Clock;
		
	always
		#1 clkNorm=~clkNorm;

initial
begin
			iSamples0=8'b00000010; //02
			iSamples1=8'b00000101; //05
			iSamples2=8'b11111110; //FE
			iSamples3=8'b00000000; //00
			iSamples4=8'b00000001; //01
			iSamples5=8'b11111100; //FC
			iSamples6=8'b00000011; //03
			iSamples7=8'b00000010; //02
			Reset=0;
end
	
	//Instancia del modulo
	FFT_Calculator calcu(iSamples0, iSamples1, iSamples2, iSamples3, iSamples4, iSamples5, iSamples6, iSamples7, oResult0, oResult1, oResult3, oResult4, oResult5, oResult6, oResult7, oResult8, oResult9, oResult10, oResult11, oResult12, oResult13, oResult14, oResult15,  Clock, clkNorm, Reset, clkNorm);

	time simulationTime;

	//generador de senales
	initial
		begin
			$display("Corriendo Calculator \n");
		end

		initial
			begin
				#500 $finish;
			end

	initial
		begin
			$monitor($time, "  iSamples[0]=%h, iSamples[1]=%h, iSamples[2]=%h, iSamples[3]=%h, iSamples[4]=%h, iSamples[5]=%h, iSamples[6]=%h, iSamples[7]=%h,", iSamples0, iSamples1,iSamples2,iSamples3,iSamples4,iSamples5,iSamples6,iSamples7);
			$dumpfile("calculator.vcd");
			$dumpvars;
			Clock=0;clkNorm=0;Reset=1;iSamples0=8'b00000000;iSamples1=8'b00000000;iSamples2=8'b00000000;iSamples3=8'b00000000;iSamples4=8'b00000000;
			iSamples5=8'b00000000;iSamples6=8'b00000000;iSamples7=8'b00000000;
			#35;
		
			//inicializacion del registro de muestras
		end
endmodule
