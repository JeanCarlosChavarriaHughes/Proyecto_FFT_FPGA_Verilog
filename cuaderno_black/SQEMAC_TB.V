//  C:\USERS\JEANCARLOS\DROPBOX\LABORATORIOS DE DIGITALES\PROYECTOFINAL\CUADERNO BLACK\SQEMAC_TB.V
//  Verilog testbench created by
//  Xilinx's StateBench 1.01
//  Sun Dec 07 17:39:03 2014

`timescale 1ns/1ns

module testbench;
	wire [7:0] M1Im;
	wire [7:0] M1R;
	wire [7:0] M2Im;
	wire [7:0] M2R;
	wire [7:0] M3Im;
	wire [7:0] M3R;
	wire [7:0] M4Im;
	wire [7:0] M4R;
	wire [7:0] M5Im;
	wire [7:0] M5R;
	wire [7:0] M6Im;
	wire [7:0] M6R;
	wire [7:0] M7Im;
	wire [7:0] M7R;
	wire [7:0] M8Im;
	wire [7:0] M8R;
	reg [7:0] VAR0;
	reg [7:0] VAR1;
	reg [7:0] VAR2;
	reg [7:0] VAR3;
	reg [7:0] VAR4;
	reg [7:0] VAR5;
	reg [7:0] VAR6;
	reg [7:0] VAR7;

	sqemac UUT (.M1Im(M1Im),.M1R(M1R),.M2Im(M2Im),.M2R(M2R),.M3Im(M3Im),.M3R(M3R),.M4Im(M4Im),.M4R(M4R),.M5Im(M5Im),.M5R(M5R),.M6Im(M6Im),.M6R(M6R),.M7Im(M7Im),.M7R(M7R),.M8Im(M8Im),.M8R(M8R),.VAR0(VAR0),.VAR1(VAR1),.VAR2(VAR2),.VAR3(VAR3),.VAR4(VAR4),.VAR5(VAR5),.VAR6(VAR6),.VAR7(VAR7));

	integer TX_FILE;
	integer TX_ERROR;

initial
begin
	TX_ERROR=0;
	TX_FILE=$fopen("results.txt");

	// --------------------
	VAR0 = 8'h2;
	VAR1 = 8'h1;
	VAR2 = 8'hfe;
	VAR3 = 8'h3;
	VAR4 = 8'h5;
	VAR5 = 8'hfc;
	VAR6 = 8'h0;
	VAR7 = 8'h2;
	#15;
	// ----------------------
	// Time 15 ns
	#20;
	CHECK_M1Im(8'h0);
	CHECK_M1R(8'h5);
	CHECK_M2Im(8'h2);
	CHECK_M2R(8'hfc);
	CHECK_M3Im(8'h0);
	CHECK_M3R(8'h8);
	CHECK_M4Im(8'hfd);
	CHECK_M4R(8'hfc);
	CHECK_M5Im(8'h0);
	CHECK_M5R(8'h2);
	CHECK_M6Im(8'hff);
	CHECK_M6R(8'h4);
	CHECK_M7Im(8'h0);
	CHECK_M7R(8'hf7);
	CHECK_M8Im(8'h0);
	CHECK_M8R(8'h4);
	#30;
	#35;

	if (TX_ERROR == 0) begin
		$display("No errors or warnings");
		$fdisplay(TX_FILE,"No errors or warnings");
	end else begin
		$display("%0d errors found in simulation",TX_ERROR);
		$fdisplay(TX_FILE,"%0d errors found in simulation",TX_ERROR);
	end

	$fclose(TX_FILE);

end

task CHECK_M1Im;

	input [7:0] NEXT_M1Im;

	#0 begin
		if (NEXT_M1Im !== M1Im) begin
			$display("Error at time=%0dns M1Im=8'h%0h, expected=8'h%0h",
				$time, M1Im, NEXT_M1Im);
			$fdisplay(TX_FILE,"Error at time=%0dns M1Im=8'h%0h, expected=8'h%0h",
				$time, M1Im, NEXT_M1Im);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M1R;

	input [7:0] NEXT_M1R;

	#0 begin
		if (NEXT_M1R !== M1R) begin
			$display("Error at time=%0dns M1R=8'h%0h, expected=8'h%0h",
				$time, M1R, NEXT_M1R);
			$fdisplay(TX_FILE,"Error at time=%0dns M1R=8'h%0h, expected=8'h%0h",
				$time, M1R, NEXT_M1R);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M2Im;

	input [7:0] NEXT_M2Im;

	#0 begin
		if (NEXT_M2Im !== M2Im) begin
			$display("Error at time=%0dns M2Im=8'h%0h, expected=8'h%0h",
				$time, M2Im, NEXT_M2Im);
			$fdisplay(TX_FILE,"Error at time=%0dns M2Im=8'h%0h, expected=8'h%0h",
				$time, M2Im, NEXT_M2Im);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M2R;

	input [7:0] NEXT_M2R;

	#0 begin
		if (NEXT_M2R !== M2R) begin
			$display("Error at time=%0dns M2R=8'h%0h, expected=8'h%0h",
				$time, M2R, NEXT_M2R);
			$fdisplay(TX_FILE,"Error at time=%0dns M2R=8'h%0h, expected=8'h%0h",
				$time, M2R, NEXT_M2R);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M3Im;

	input [7:0] NEXT_M3Im;

	#0 begin
		if (NEXT_M3Im !== M3Im) begin
			$display("Error at time=%0dns M3Im=8'h%0h, expected=8'h%0h",
				$time, M3Im, NEXT_M3Im);
			$fdisplay(TX_FILE,"Error at time=%0dns M3Im=8'h%0h, expected=8'h%0h",
				$time, M3Im, NEXT_M3Im);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M3R;

	input [7:0] NEXT_M3R;

	#0 begin
		if (NEXT_M3R !== M3R) begin
			$display("Error at time=%0dns M3R=8'h%0h, expected=8'h%0h",
				$time, M3R, NEXT_M3R);
			$fdisplay(TX_FILE,"Error at time=%0dns M3R=8'h%0h, expected=8'h%0h",
				$time, M3R, NEXT_M3R);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M4Im;

	input [7:0] NEXT_M4Im;

	#0 begin
		if (NEXT_M4Im !== M4Im) begin
			$display("Error at time=%0dns M4Im=8'h%0h, expected=8'h%0h",
				$time, M4Im, NEXT_M4Im);
			$fdisplay(TX_FILE,"Error at time=%0dns M4Im=8'h%0h, expected=8'h%0h",
				$time, M4Im, NEXT_M4Im);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M4R;

	input [7:0] NEXT_M4R;

	#0 begin
		if (NEXT_M4R !== M4R) begin
			$display("Error at time=%0dns M4R=8'h%0h, expected=8'h%0h",
				$time, M4R, NEXT_M4R);
			$fdisplay(TX_FILE,"Error at time=%0dns M4R=8'h%0h, expected=8'h%0h",
				$time, M4R, NEXT_M4R);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M5Im;

	input [7:0] NEXT_M5Im;

	#0 begin
		if (NEXT_M5Im !== M5Im) begin
			$display("Error at time=%0dns M5Im=8'h%0h, expected=8'h%0h",
				$time, M5Im, NEXT_M5Im);
			$fdisplay(TX_FILE,"Error at time=%0dns M5Im=8'h%0h, expected=8'h%0h",
				$time, M5Im, NEXT_M5Im);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M5R;

	input [7:0] NEXT_M5R;

	#0 begin
		if (NEXT_M5R !== M5R) begin
			$display("Error at time=%0dns M5R=8'h%0h, expected=8'h%0h",
				$time, M5R, NEXT_M5R);
			$fdisplay(TX_FILE,"Error at time=%0dns M5R=8'h%0h, expected=8'h%0h",
				$time, M5R, NEXT_M5R);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M6Im;

	input [7:0] NEXT_M6Im;

	#0 begin
		if (NEXT_M6Im !== M6Im) begin
			$display("Error at time=%0dns M6Im=8'h%0h, expected=8'h%0h",
				$time, M6Im, NEXT_M6Im);
			$fdisplay(TX_FILE,"Error at time=%0dns M6Im=8'h%0h, expected=8'h%0h",
				$time, M6Im, NEXT_M6Im);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M6R;

	input [7:0] NEXT_M6R;

	#0 begin
		if (NEXT_M6R !== M6R) begin
			$display("Error at time=%0dns M6R=8'h%0h, expected=8'h%0h",
				$time, M6R, NEXT_M6R);
			$fdisplay(TX_FILE,"Error at time=%0dns M6R=8'h%0h, expected=8'h%0h",
				$time, M6R, NEXT_M6R);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M7Im;

	input [7:0] NEXT_M7Im;

	#0 begin
		if (NEXT_M7Im !== M7Im) begin
			$display("Error at time=%0dns M7Im=8'h%0h, expected=8'h%0h",
				$time, M7Im, NEXT_M7Im);
			$fdisplay(TX_FILE,"Error at time=%0dns M7Im=8'h%0h, expected=8'h%0h",
				$time, M7Im, NEXT_M7Im);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M7R;

	input [7:0] NEXT_M7R;

	#0 begin
		if (NEXT_M7R !== M7R) begin
			$display("Error at time=%0dns M7R=8'h%0h, expected=8'h%0h",
				$time, M7R, NEXT_M7R);
			$fdisplay(TX_FILE,"Error at time=%0dns M7R=8'h%0h, expected=8'h%0h",
				$time, M7R, NEXT_M7R);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M8Im;

	input [7:0] NEXT_M8Im;

	#0 begin
		if (NEXT_M8Im !== M8Im) begin
			$display("Error at time=%0dns M8Im=8'h%0h, expected=8'h%0h",
				$time, M8Im, NEXT_M8Im);
			$fdisplay(TX_FILE,"Error at time=%0dns M8Im=8'h%0h, expected=8'h%0h",
				$time, M8Im, NEXT_M8Im);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

task CHECK_M8R;

	input [7:0] NEXT_M8R;

	#0 begin
		if (NEXT_M8R !== M8R) begin
			$display("Error at time=%0dns M8R=8'h%0h, expected=8'h%0h",
				$time, M8R, NEXT_M8R);
			$fdisplay(TX_FILE,"Error at time=%0dns M8R=8'h%0h, expected=8'h%0h",
				$time, M8R, NEXT_M8R);
			TX_ERROR = TX_ERROR + 1;
		end
	end
endtask

endmodule
