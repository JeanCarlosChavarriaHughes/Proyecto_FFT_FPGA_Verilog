//  C:\USERS\JEANCARLOS\DROPBOX\...\SQEMAC.v
//  Verilog created by Xilinx's StateCAD 6.1i
//  Sun Dec 07 17:42:18 2014

//  This Verilog code (for use with Xilinx XST) was generated using: 
//  one-hot state assignment with boolean code format.
//  Minimization is enabled,  implied else is enabled, 
//  and outputs are speed optimized.

`timescale 1s/1s

module shell_sqemac(VAR00,VAR01,VAR02,VAR03,VAR04,VAR05,VAR06,VAR07,VAR10,
	VAR11,VAR12,VAR13,VAR14,VAR15,VAR16,VAR17,VAR20,VAR21,VAR22,VAR23,VAR24,VAR25
	,VAR26,VAR27,VAR30,VAR31,VAR32,VAR33,VAR34,VAR35,VAR36,VAR37,VAR40,VAR41,
	VAR42,VAR43,VAR44,VAR45,VAR46,VAR47,VAR50,VAR51,VAR52,VAR53,VAR54,VAR55,VAR56
	,VAR57,VAR60,VAR61,VAR62,VAR63,VAR64,VAR65,VAR66,VAR67,VAR70,VAR71,VAR72,
	VAR73,VAR74,VAR75,VAR76,VAR77,M1Im0,M1Im1,M1Im2,M1Im3,M1Im4,M1Im5,M1Im6,M1Im7
	,M1R0,M1R1,M1R2,M1R3,M1R4,M1R5,M1R6,M1R7,M2Im0,M2Im1,M2Im2,M2Im3,M2Im4,M2Im5,
	M2Im6,M2Im7,M2R0,M2R1,M2R2,M2R3,M2R4,M2R5,M2R6,M2R7,M3Im0,M3Im1,M3Im2,M3Im3,
	M3Im4,M3Im5,M3Im6,M3Im7,M3R0,M3R1,M3R2,M3R3,M3R4,M3R5,M3R6,M3R7,M4Im0,M4Im1,
	M4Im2,M4Im3,M4Im4,M4Im5,M4Im6,M4Im7,M4R0,M4R1,M4R2,M4R3,M4R4,M4R5,M4R6,M4R7,
	M5Im0,M5Im1,M5Im2,M5Im3,M5Im4,M5Im5,M5Im6,M5Im7,M5R0,M5R1,M5R2,M5R3,M5R4,M5R5
	,M5R6,M5R7,M6Im0,M6Im1,M6Im2,M6Im3,M6Im4,M6Im5,M6Im6,M6Im7,M6R0,M6R1,M6R2,
	M6R3,M6R4,M6R5,M6R6,M6R7,M7Im0,M7Im1,M7Im2,M7Im3,M7Im4,M7Im5,M7Im6,M7Im7,M7R0
	,M7R1,M7R2,M7R3,M7R4,M7R5,M7R6,M7R7,M8Im0,M8Im1,M8Im2,M8Im3,M8Im4,M8Im5,M8Im6
	,M8Im7,M8R0,M8R1,M8R2,M8R3,M8R4,M8R5,M8R6,M8R7);

	input VAR00,VAR01,VAR02,VAR03,VAR04,VAR05,VAR06,VAR07,VAR10,VAR11,VAR12,
		VAR13,VAR14,VAR15,VAR16,VAR17,VAR20,VAR21,VAR22,VAR23,VAR24,VAR25,VAR26,VAR27
		,VAR30,VAR31,VAR32,VAR33,VAR34,VAR35,VAR36,VAR37,VAR40,VAR41,VAR42,VAR43,
		VAR44,VAR45,VAR46,VAR47,VAR50,VAR51,VAR52,VAR53,VAR54,VAR55,VAR56,VAR57,VAR60
		,VAR61,VAR62,VAR63,VAR64,VAR65,VAR66,VAR67,VAR70,VAR71,VAR72,VAR73,VAR74,
		VAR75,VAR76,VAR77;
	output M1Im0,M1Im1,M1Im2,M1Im3,M1Im4,M1Im5,M1Im6,M1Im7,M1R0,M1R1,M1R2,M1R3,
		M1R4,M1R5,M1R6,M1R7,M2Im0,M2Im1,M2Im2,M2Im3,M2Im4,M2Im5,M2Im6,M2Im7,M2R0,M2R1
		,M2R2,M2R3,M2R4,M2R5,M2R6,M2R7,M3Im0,M3Im1,M3Im2,M3Im3,M3Im4,M3Im5,M3Im6,
		M3Im7,M3R0,M3R1,M3R2,M3R3,M3R4,M3R5,M3R6,M3R7,M4Im0,M4Im1,M4Im2,M4Im3,M4Im4,
		M4Im5,M4Im6,M4Im7,M4R0,M4R1,M4R2,M4R3,M4R4,M4R5,M4R6,M4R7,M5Im0,M5Im1,M5Im2,
		M5Im3,M5Im4,M5Im5,M5Im6,M5Im7,M5R0,M5R1,M5R2,M5R3,M5R4,M5R5,M5R6,M5R7,M6Im0,
		M6Im1,M6Im2,M6Im3,M6Im4,M6Im5,M6Im6,M6Im7,M6R0,M6R1,M6R2,M6R3,M6R4,M6R5,M6R6,
		M6R7,M7Im0,M7Im1,M7Im2,M7Im3,M7Im4,M7Im5,M7Im6,M7Im7,M7R0,M7R1,M7R2,M7R3,M7R4
		,M7R5,M7R6,M7R7,M8Im0,M8Im1,M8Im2,M8Im3,M8Im4,M8Im5,M8Im6,M8Im7,M8R0,M8R1,
		M8R2,M8R3,M8R4,M8R5,M8R6,M8R7;

	reg [7:0] L1;
	reg [7:0] L2;
	reg [7:0] L3;
	reg [7:0] L4;
	reg [7:0] L5;
	reg [7:0] L6;
	reg [7:0] L7;
	reg [7:0] L8;
	reg [7:0] M1Im;
	reg [7:0] M1R;
	reg [7:0] M2Im;
	reg [7:0] M2R;
	reg [7:0] M3Im;
	reg [7:0] M3R;
	reg [7:0] M4Im;
	reg [7:0] M4R;
	reg [7:0] M5Im;
	reg [7:0] M5R;
	reg [7:0] M6Im;
	reg [7:0] M6R;
	reg [7:0] M7Im;
	reg [7:0] M7R;
	reg [7:0] M8Im;
	reg [7:0] M8R;
	reg [7:0] NL3;
	reg [7:0] NL7;
	reg [7:0] NVAR4;
	reg [7:0] NVAR5;
	reg [7:0] NVAR6;
	reg [7:0] NVAR7;
	reg L10,L11,L12,L13,L14,L15,L16,L17,L20,L21,L22,L23,L24,L25,L26,L27,L30,L31,
		L32,L33,L34,L35,L36,L37,L40,L41,L42,L43,L44,L45,L46,L47,L50,L51,L52,L53,L54,
		L55,L56,L57,L60,L61,L62,L63,L64,L65,L66,L67,L70,L71,L72,L73,L74,L75,L76,L77,
		L80,L81,L82,L83,L84,L85,L86,L87,M1Im0,M1Im1,M1Im2,M1Im3,M1Im4,M1Im5,M1Im6,
		M1Im7,M1R0,M1R1,M1R2,M1R3,M1R4,M1R5,M1R6,M1R7,M2Im0,M2Im1,M2Im2,M2Im3,M2Im4,
		M2Im5,M2Im6,M2Im7,M2R0,M2R1,M2R2,M2R3,M2R4,M2R5,M2R6,M2R7,M3Im0,M3Im1,M3Im2,
		M3Im3,M3Im4,M3Im5,M3Im6,M3Im7,M3R0,M3R1,M3R2,M3R3,M3R4,M3R5,M3R6,M3R7,M4Im0,
		M4Im1,M4Im2,M4Im3,M4Im4,M4Im5,M4Im6,M4Im7,M4R0,M4R1,M4R2,M4R3,M4R4,M4R5,M4R6,
		M4R7,M5Im0,M5Im1,M5Im2,M5Im3,M5Im4,M5Im5,M5Im6,M5Im7,M5R0,M5R1,M5R2,M5R3,M5R4
		,M5R5,M5R6,M5R7,M6Im0,M6Im1,M6Im2,M6Im3,M6Im4,M6Im5,M6Im6,M6Im7,M6R0,M6R1,
		M6R2,M6R3,M6R4,M6R5,M6R6,M6R7,M7Im0,M7Im1,M7Im2,M7Im3,M7Im4,M7Im5,M7Im6,M7Im7
		,M7R0,M7R1,M7R2,M7R3,M7R4,M7R5,M7R6,M7R7,M8Im0,M8Im1,M8Im2,M8Im3,M8Im4,M8Im5,
		M8Im6,M8Im7,M8R0,M8R1,M8R2,M8R3,M8R4,M8R5,M8R6,M8R7,NL30,NL31,NL32,NL33,NL34,
		NL35,NL36,NL37,NL70,NL71,NL72,NL73,NL74,NL75,NL76,NL77,NVAR40,NVAR41,NVAR42,
		NVAR43,NVAR44,NVAR45,NVAR46,NVAR47,NVAR50,NVAR51,NVAR52,NVAR53,NVAR54,NVAR55,
		NVAR56,NVAR57,NVAR60,NVAR61,NVAR62,NVAR63,NVAR64,NVAR65,NVAR66,NVAR67,NVAR70,
		NVAR71,NVAR72,NVAR73,NVAR74,NVAR75,NVAR76,NVAR77;


	always @(VAR00 or VAR01 or VAR02 or VAR03 or VAR04 or VAR05 or VAR06 or 
		VAR07 or VAR40 or VAR41 or VAR42 or VAR43 or VAR44 or VAR45 or VAR46 or VAR47
		 or L1)
	begin
		L1= ( {VAR07,VAR06,VAR05,VAR04,VAR03,VAR02,VAR01,VAR00}  + {VAR47,VAR46,
			VAR45,VAR44,VAR43,VAR42,VAR41,VAR40}  );
		L10 = L1[0];
		L11 = L1[1];
		L12 = L1[2];
		L13 = L1[3];
		L14 = L1[4];
		L15 = L1[5];
		L16 = L1[6];
		L17 = L1[7];
	end

	always @(NVAR40 or NVAR41 or NVAR42 or NVAR43 or NVAR44 or NVAR45 or NVAR46 
		or NVAR47 or VAR00 or VAR01 or VAR02 or VAR03 or VAR04 or VAR05 or VAR06 or 
		VAR07 or L2)
	begin
		L2= ( {VAR07,VAR06,VAR05,VAR04,VAR03,VAR02,VAR01,VAR00}  + {NVAR47,NVAR46,
			NVAR45,NVAR44,NVAR43,NVAR42,NVAR41,NVAR40}  );
		L20 = L2[0];
		L21 = L2[1];
		L22 = L2[2];
		L23 = L2[3];
		L24 = L2[4];
		L25 = L2[5];
		L26 = L2[6];
		L27 = L2[7];
	end

	always @(VAR20 or VAR21 or VAR22 or VAR23 or VAR24 or VAR25 or VAR26 or 
		VAR27 or VAR60 or VAR61 or VAR62 or VAR63 or VAR64 or VAR65 or VAR66 or VAR67
		 or L3)
	begin
		L3= ( {VAR27,VAR26,VAR25,VAR24,VAR23,VAR22,VAR21,VAR20}  + {VAR67,VAR66,
			VAR65,VAR64,VAR63,VAR62,VAR61,VAR60}  );
		L30 = L3[0];
		L31 = L3[1];
		L32 = L3[2];
		L33 = L3[3];
		L34 = L3[4];
		L35 = L3[5];
		L36 = L3[6];
		L37 = L3[7];
	end

	always @(NVAR60 or NVAR61 or NVAR62 or NVAR63 or NVAR64 or NVAR65 or NVAR66 
		or NVAR67 or VAR20 or VAR21 or VAR22 or VAR23 or VAR24 or VAR25 or VAR26 or 
		VAR27 or L4)
	begin
		L4= ( {VAR27,VAR26,VAR25,VAR24,VAR23,VAR22,VAR21,VAR20}  + {NVAR67,NVAR66,
			NVAR65,NVAR64,NVAR63,NVAR62,NVAR61,NVAR60}  );
		L40 = L4[0];
		L41 = L4[1];
		L42 = L4[2];
		L43 = L4[3];
		L44 = L4[4];
		L45 = L4[5];
		L46 = L4[6];
		L47 = L4[7];
	end

	always @(VAR10 or VAR11 or VAR12 or VAR13 or VAR14 or VAR15 or VAR16 or 
		VAR17 or VAR50 or VAR51 or VAR52 or VAR53 or VAR54 or VAR55 or VAR56 or VAR57
		 or L5)
	begin
		L5= ( {VAR17,VAR16,VAR15,VAR14,VAR13,VAR12,VAR11,VAR10}  + {VAR57,VAR56,
			VAR55,VAR54,VAR53,VAR52,VAR51,VAR50}  );
		L50 = L5[0];
		L51 = L5[1];
		L52 = L5[2];
		L53 = L5[3];
		L54 = L5[4];
		L55 = L5[5];
		L56 = L5[6];
		L57 = L5[7];
	end

	always @(NVAR50 or NVAR51 or NVAR52 or NVAR53 or NVAR54 or NVAR55 or NVAR56 
		or NVAR57 or VAR10 or VAR11 or VAR12 or VAR13 or VAR14 or VAR15 or VAR16 or 
		VAR17 or L6)
	begin
		L6= ( {VAR17,VAR16,VAR15,VAR14,VAR13,VAR12,VAR11,VAR10}  + {NVAR57,NVAR56,
			NVAR55,NVAR54,NVAR53,NVAR52,NVAR51,NVAR50}  );
		L60 = L6[0];
		L61 = L6[1];
		L62 = L6[2];
		L63 = L6[3];
		L64 = L6[4];
		L65 = L6[5];
		L66 = L6[6];
		L67 = L6[7];
	end

	always @(VAR30 or VAR31 or VAR32 or VAR33 or VAR34 or VAR35 or VAR36 or 
		VAR37 or VAR70 or VAR71 or VAR72 or VAR73 or VAR74 or VAR75 or VAR76 or VAR77
		 or L7)
	begin
		L7= ( {VAR37,VAR36,VAR35,VAR34,VAR33,VAR32,VAR31,VAR30}  + {VAR77,VAR76,
			VAR75,VAR74,VAR73,VAR72,VAR71,VAR70}  );
		L70 = L7[0];
		L71 = L7[1];
		L72 = L7[2];
		L73 = L7[3];
		L74 = L7[4];
		L75 = L7[5];
		L76 = L7[6];
		L77 = L7[7];
	end

	always @(NVAR70 or NVAR71 or NVAR72 or NVAR73 or NVAR74 or NVAR75 or NVAR76 
		or NVAR77 or VAR30 or VAR31 or VAR32 or VAR33 or VAR34 or VAR35 or VAR36 or 
		VAR37 or L8)
	begin
		L8= ( {VAR37,VAR36,VAR35,VAR34,VAR33,VAR32,VAR31,VAR30}  + {NVAR77,NVAR76,
			NVAR75,NVAR74,NVAR73,NVAR72,NVAR71,NVAR70}  );
		L80 = L8[0];
		L81 = L8[1];
		L82 = L8[2];
		L83 = L8[3];
		L84 = L8[4];
		L85 = L8[5];
		L86 = L8[6];
		L87 = L8[7];
	end

	always @(M1Im)
	begin
		M1Im= 'h0;
		M1Im0 = M1Im[0];
		M1Im1 = M1Im[1];
		M1Im2 = M1Im[2];
		M1Im3 = M1Im[3];
		M1Im4 = M1Im[4];
		M1Im5 = M1Im[5];
		M1Im6 = M1Im[6];
		M1Im7 = M1Im[7];
	end

	always @(L10 or L11 or L12 or L13 or L14 or L15 or L16 or L17 or L30 or L31 
		or L32 or L33 or L34 or L35 or L36 or L37 or M1R)
	begin
		M1R= ( {L17,L16,L15,L14,L13,L12,L11,L10}  + {L37,L36,L35,L34,L33,L32,L31,
			L30}  );
		M1R0 = M1R[0];
		M1R1 = M1R[1];
		M1R2 = M1R[2];
		M1R3 = M1R[3];
		M1R4 = M1R[4];
		M1R5 = M1R[5];
		M1R6 = M1R[6];
		M1R7 = M1R[7];
	end

	always @(L40 or L41 or L42 or L43 or L44 or L45 or L46 or L47 or M2Im)
	begin
		M2Im= ~{L47,L46,L45,L44,L43,L42,L41,L40} ;
		M2Im0 = M2Im[0];
		M2Im1 = M2Im[1];
		M2Im2 = M2Im[2];
		M2Im3 = M2Im[3];
		M2Im4 = M2Im[4];
		M2Im5 = M2Im[5];
		M2Im6 = M2Im[6];
		M2Im7 = M2Im[7];
	end

	always @(L20 or L21 or L22 or L23 or L24 or L25 or L26 or L27 or M2R)
	begin
		M2R= {L27,L26,L25,L24,L23,L22,L21,L20} ;
		M2R0 = M2R[0];
		M2R1 = M2R[1];
		M2R2 = M2R[2];
		M2R3 = M2R[3];
		M2R4 = M2R[4];
		M2R5 = M2R[5];
		M2R6 = M2R[6];
		M2R7 = M2R[7];
	end

	always @(M3Im)
	begin
		M3Im= 'h0;
		M3Im0 = M3Im[0];
		M3Im1 = M3Im[1];
		M3Im2 = M3Im[2];
		M3Im3 = M3Im[3];
		M3Im4 = M3Im[4];
		M3Im5 = M3Im[5];
		M3Im6 = M3Im[6];
		M3Im7 = M3Im[7];
	end

	always @(L10 or L11 or L12 or L13 or L14 or L15 or L16 or L17 or NL30 or 
		NL31 or NL32 or NL33 or NL34 or NL35 or NL36 or NL37 or M3R)
	begin
		M3R= ( {L17,L16,L15,L14,L13,L12,L11,L10}  + {NL37,NL36,NL35,NL34,NL33,NL32,
			NL31,NL30}  );
		M3R0 = M3R[0];
		M3R1 = M3R[1];
		M3R2 = M3R[2];
		M3R3 = M3R[3];
		M3R4 = M3R[4];
		M3R5 = M3R[5];
		M3R6 = M3R[6];
		M3R7 = M3R[7];
	end

	always @(L40 or L41 or L42 or L43 or L44 or L45 or L46 or L47 or M4Im)
	begin
		M4Im= {L47,L46,L45,L44,L43,L42,L41,L40} ;
		M4Im0 = M4Im[0];
		M4Im1 = M4Im[1];
		M4Im2 = M4Im[2];
		M4Im3 = M4Im[3];
		M4Im4 = M4Im[4];
		M4Im5 = M4Im[5];
		M4Im6 = M4Im[6];
		M4Im7 = M4Im[7];
	end

	always @(L20 or L21 or L22 or L23 or L24 or L25 or L26 or L27 or M4R)
	begin
		M4R= {L27,L26,L25,L24,L23,L22,L21,L20} ;
		M4R0 = M4R[0];
		M4R1 = M4R[1];
		M4R2 = M4R[2];
		M4R3 = M4R[3];
		M4R4 = M4R[4];
		M4R5 = M4R[5];
		M4R6 = M4R[6];
		M4R7 = M4R[7];
	end

	always @(M5Im)
	begin
		M5Im= 'h0;
		M5Im0 = M5Im[0];
		M5Im1 = M5Im[1];
		M5Im2 = M5Im[2];
		M5Im3 = M5Im[3];
		M5Im4 = M5Im[4];
		M5Im5 = M5Im[5];
		M5Im6 = M5Im[6];
		M5Im7 = M5Im[7];
	end

	always @(L50 or L51 or L52 or L53 or L54 or L55 or L56 or L57 or L70 or L71 
		or L72 or L73 or L74 or L75 or L76 or L77 or M5R)
	begin
		M5R= ( {L57,L56,L55,L54,L53,L52,L51,L50}  + {L77,L76,L75,L74,L73,L72,L71,
			L70}  );
		M5R0 = M5R[0];
		M5R1 = M5R[1];
		M5R2 = M5R[2];
		M5R3 = M5R[3];
		M5R4 = M5R[4];
		M5R5 = M5R[5];
		M5R6 = M5R[6];
		M5R7 = M5R[7];
	end

	always @(L80 or L81 or L82 or L83 or L84 or L85 or L86 or L87 or M6Im)
	begin
		M6Im= ~{L87,L86,L85,L84,L83,L82,L81,L80} ;
		M6Im0 = M6Im[0];
		M6Im1 = M6Im[1];
		M6Im2 = M6Im[2];
		M6Im3 = M6Im[3];
		M6Im4 = M6Im[4];
		M6Im5 = M6Im[5];
		M6Im6 = M6Im[6];
		M6Im7 = M6Im[7];
	end

	always @(L60 or L61 or L62 or L63 or L64 or L65 or L66 or L67 or M6R)
	begin
		M6R= {L67,L66,L65,L64,L63,L62,L61,L60} ;
		M6R0 = M6R[0];
		M6R1 = M6R[1];
		M6R2 = M6R[2];
		M6R3 = M6R[3];
		M6R4 = M6R[4];
		M6R5 = M6R[5];
		M6R6 = M6R[6];
		M6R7 = M6R[7];
	end

	always @(M7Im)
	begin
		M7Im= 'h0;
		M7Im0 = M7Im[0];
		M7Im1 = M7Im[1];
		M7Im2 = M7Im[2];
		M7Im3 = M7Im[3];
		M7Im4 = M7Im[4];
		M7Im5 = M7Im[5];
		M7Im6 = M7Im[6];
		M7Im7 = M7Im[7];
	end

	always @(L50 or L51 or L52 or L53 or L54 or L55 or L56 or L57 or NL70 or 
		NL71 or NL72 or NL73 or NL74 or NL75 or NL76 or NL77 or M7R)
	begin
		M7R= ( {L57,L56,L55,L54,L53,L52,L51,L50}  + {NL77,NL76,NL75,NL74,NL73,NL72,
			NL71,NL70}  );
		M7R0 = M7R[0];
		M7R1 = M7R[1];
		M7R2 = M7R[2];
		M7R3 = M7R[3];
		M7R4 = M7R[4];
		M7R5 = M7R[5];
		M7R6 = M7R[6];
		M7R7 = M7R[7];
	end

	always @(L80 or L81 or L82 or L83 or L84 or L85 or L86 or L87 or M8Im)
	begin
		M8Im= {L87,L86,L85,L84,L83,L82,L81,L80} ;
		M8Im0 = M8Im[0];
		M8Im1 = M8Im[1];
		M8Im2 = M8Im[2];
		M8Im3 = M8Im[3];
		M8Im4 = M8Im[4];
		M8Im5 = M8Im[5];
		M8Im6 = M8Im[6];
		M8Im7 = M8Im[7];
	end

	always @(L60 or L61 or L62 or L63 or L64 or L65 or L66 or L67 or M8R)
	begin
		M8R= {L67,L66,L65,L64,L63,L62,L61,L60} ;
		M8R0 = M8R[0];
		M8R1 = M8R[1];
		M8R2 = M8R[2];
		M8R3 = M8R[3];
		M8R4 = M8R[4];
		M8R5 = M8R[5];
		M8R6 = M8R[6];
		M8R7 = M8R[7];
	end

	always @(L30 or L31 or L32 or L33 or L34 or L35 or L36 or L37 or NL3)
	begin
		NL3= ~{L37,L36,L35,L34,L33,L32,L31,L30} ;
		NL30 = NL3[0];
		NL31 = NL3[1];
		NL32 = NL3[2];
		NL33 = NL3[3];
		NL34 = NL3[4];
		NL35 = NL3[5];
		NL36 = NL3[6];
		NL37 = NL3[7];
	end

	always @(L70 or L71 or L72 or L73 or L74 or L75 or L76 or L77 or NL7)
	begin
		NL7= ~{L77,L76,L75,L74,L73,L72,L71,L70} ;
		NL70 = NL7[0];
		NL71 = NL7[1];
		NL72 = NL7[2];
		NL73 = NL7[3];
		NL74 = NL7[4];
		NL75 = NL7[5];
		NL76 = NL7[6];
		NL77 = NL7[7];
	end

	always @(VAR40 or VAR41 or VAR42 or VAR43 or VAR44 or VAR45 or VAR46 or 
		VAR47 or NVAR4)
	begin
		NVAR4= ~{VAR47,VAR46,VAR45,VAR44,VAR43,VAR42,VAR41,VAR40} ;
		NVAR40 = NVAR4[0];
		NVAR41 = NVAR4[1];
		NVAR42 = NVAR4[2];
		NVAR43 = NVAR4[3];
		NVAR44 = NVAR4[4];
		NVAR45 = NVAR4[5];
		NVAR46 = NVAR4[6];
		NVAR47 = NVAR4[7];
	end

	always @(VAR50 or VAR51 or VAR52 or VAR53 or VAR54 or VAR55 or VAR56 or 
		VAR57 or NVAR5)
	begin
		NVAR5= ~{VAR57,VAR56,VAR55,VAR54,VAR53,VAR52,VAR51,VAR50} ;
		NVAR50 = NVAR5[0];
		NVAR51 = NVAR5[1];
		NVAR52 = NVAR5[2];
		NVAR53 = NVAR5[3];
		NVAR54 = NVAR5[4];
		NVAR55 = NVAR5[5];
		NVAR56 = NVAR5[6];
		NVAR57 = NVAR5[7];
	end

	always @(VAR60 or VAR61 or VAR62 or VAR63 or VAR64 or VAR65 or VAR66 or 
		VAR67 or NVAR6)
	begin
		NVAR6= ~{VAR67,VAR66,VAR65,VAR64,VAR63,VAR62,VAR61,VAR60} ;
		NVAR60 = NVAR6[0];
		NVAR61 = NVAR6[1];
		NVAR62 = NVAR6[2];
		NVAR63 = NVAR6[3];
		NVAR64 = NVAR6[4];
		NVAR65 = NVAR6[5];
		NVAR66 = NVAR6[6];
		NVAR67 = NVAR6[7];
	end

	always @(VAR70 or VAR71 or VAR72 or VAR73 or VAR74 or VAR75 or VAR76 or 
		VAR77 or NVAR7)
	begin
		NVAR7= ~{VAR77,VAR76,VAR75,VAR74,VAR73,VAR72,VAR71,VAR70} ;
		NVAR70 = NVAR7[0];
		NVAR71 = NVAR7[1];
		NVAR72 = NVAR7[2];
		NVAR73 = NVAR7[3];
		NVAR74 = NVAR7[4];
		NVAR75 = NVAR7[5];
		NVAR76 = NVAR7[6];
		NVAR77 = NVAR7[7];
	end
endmodule

module sqemac(M1Im,M1R,M2Im,M2R,M3Im,M3R,M4Im,M4R,M5Im,M5R,M6Im,M6R,M7Im,M7R,
	M8Im,M8R,VAR0,VAR1,VAR2,VAR3,VAR4,VAR5,VAR6,VAR7);

	output [7:0] M1Im;
	output [7:0] M1R;
	output [7:0] M2Im;
	output [7:0] M2R;
	output [7:0] M3Im;
	output [7:0] M3R;
	output [7:0] M4Im;
	output [7:0] M4R;
	output [7:0] M5Im;
	output [7:0] M5R;
	output [7:0] M6Im;
	output [7:0] M6R;
	output [7:0] M7Im;
	output [7:0] M7R;
	output [7:0] M8Im;
	output [7:0] M8R;
	input [7:0] VAR0;
	input [7:0] VAR1;
	input [7:0] VAR2;
	input [7:0] VAR3;
	input [7:0] VAR4;
	input [7:0] VAR5;
	input [7:0] VAR6;
	input [7:0] VAR7;

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
	wire [7:0] VAR0;
	wire [7:0] VAR1;
	wire [7:0] VAR2;
	wire [7:0] VAR3;
	wire [7:0] VAR4;
	wire [7:0] VAR5;
	wire [7:0] VAR6;
	wire [7:0] VAR7;

	shell_sqemac part1(.VAR00(VAR0[0]),.VAR01(VAR0[1]),.VAR02(VAR0[2]),.VAR03(
		VAR0[3]),.VAR04(VAR0[4]),.VAR05(VAR0[5]),.VAR06(VAR0[6]),.VAR07(VAR0[7]),
		.VAR10(VAR1[0]),.VAR11(VAR1[1]),.VAR12(VAR1[2]),.VAR13(VAR1[3]),.VAR14(
		VAR1[4]),.VAR15(VAR1[5]),.VAR16(VAR1[6]),.VAR17(VAR1[7]),.VAR20(VAR2[0]),
		.VAR21(VAR2[1]),.VAR22(VAR2[2]),.VAR23(VAR2[3]),.VAR24(VAR2[4]),.VAR25(
		VAR2[5]),.VAR26(VAR2[6]),.VAR27(VAR2[7]),.VAR30(VAR3[0]),.VAR31(VAR3[1]),
		.VAR32(VAR3[2]),.VAR33(VAR3[3]),.VAR34(VAR3[4]),.VAR35(VAR3[5]),.VAR36(
		VAR3[6]),.VAR37(VAR3[7]),.VAR40(VAR4[0]),.VAR41(VAR4[1]),.VAR42(VAR4[2]),
		.VAR43(VAR4[3]),.VAR44(VAR4[4]),.VAR45(VAR4[5]),.VAR46(VAR4[6]),.VAR47(
		VAR4[7]),.VAR50(VAR5[0]),.VAR51(VAR5[1]),.VAR52(VAR5[2]),.VAR53(VAR5[3]),
		.VAR54(VAR5[4]),.VAR55(VAR5[5]),.VAR56(VAR5[6]),.VAR57(VAR5[7]),.VAR60(
		VAR6[0]),.VAR61(VAR6[1]),.VAR62(VAR6[2]),.VAR63(VAR6[3]),.VAR64(VAR6[4]),
		.VAR65(VAR6[5]),.VAR66(VAR6[6]),.VAR67(VAR6[7]),.VAR70(VAR7[0]),.VAR71(
		VAR7[1]),.VAR72(VAR7[2]),.VAR73(VAR7[3]),.VAR74(VAR7[4]),.VAR75(VAR7[5]),
		.VAR76(VAR7[6]),.VAR77(VAR7[7]),.M1Im0(M1Im[0]),.M1Im1(M1Im[1]),.M1Im2(
		M1Im[2]),.M1Im3(M1Im[3]),.M1Im4(M1Im[4]),.M1Im5(M1Im[5]),.M1Im6(M1Im[6]),
		.M1Im7(M1Im[7]),.M1R0(M1R[0]),.M1R1(M1R[1]),.M1R2(M1R[2]),.M1R3(M1R[3]),.M1R4
		(M1R[4]),.M1R5(M1R[5]),.M1R6(M1R[6]),.M1R7(M1R[7]),.M2Im0(M2Im[0]),.M2Im1(
		M2Im[1]),.M2Im2(M2Im[2]),.M2Im3(M2Im[3]),.M2Im4(M2Im[4]),.M2Im5(M2Im[5]),
		.M2Im6(M2Im[6]),.M2Im7(M2Im[7]),.M2R0(M2R[0]),.M2R1(M2R[1]),.M2R2(M2R[2]),
		.M2R3(M2R[3]),.M2R4(M2R[4]),.M2R5(M2R[5]),.M2R6(M2R[6]),.M2R7(M2R[7]),.M3Im0(
		M3Im[0]),.M3Im1(M3Im[1]),.M3Im2(M3Im[2]),.M3Im3(M3Im[3]),.M3Im4(M3Im[4]),
		.M3Im5(M3Im[5]),.M3Im6(M3Im[6]),.M3Im7(M3Im[7]),.M3R0(M3R[0]),.M3R1(M3R[1]),
		.M3R2(M3R[2]),.M3R3(M3R[3]),.M3R4(M3R[4]),.M3R5(M3R[5]),.M3R6(M3R[6]),.M3R7(
		M3R[7]),.M4Im0(M4Im[0]),.M4Im1(M4Im[1]),.M4Im2(M4Im[2]),.M4Im3(M4Im[3]),
		.M4Im4(M4Im[4]),.M4Im5(M4Im[5]),.M4Im6(M4Im[6]),.M4Im7(M4Im[7]),.M4R0(M4R[0])
		,.M4R1(M4R[1]),.M4R2(M4R[2]),.M4R3(M4R[3]),.M4R4(M4R[4]),.M4R5(M4R[5]),.M4R6(
		M4R[6]),.M4R7(M4R[7]),.M5Im0(M5Im[0]),.M5Im1(M5Im[1]),.M5Im2(M5Im[2]),.M5Im3(
		M5Im[3]),.M5Im4(M5Im[4]),.M5Im5(M5Im[5]),.M5Im6(M5Im[6]),.M5Im7(M5Im[7]),
		.M5R0(M5R[0]),.M5R1(M5R[1]),.M5R2(M5R[2]),.M5R3(M5R[3]),.M5R4(M5R[4]),.M5R5(
		M5R[5]),.M5R6(M5R[6]),.M5R7(M5R[7]),.M6Im0(M6Im[0]),.M6Im1(M6Im[1]),.M6Im2(
		M6Im[2]),.M6Im3(M6Im[3]),.M6Im4(M6Im[4]),.M6Im5(M6Im[5]),.M6Im6(M6Im[6]),
		.M6Im7(M6Im[7]),.M6R0(M6R[0]),.M6R1(M6R[1]),.M6R2(M6R[2]),.M6R3(M6R[3]),.M6R4
		(M6R[4]),.M6R5(M6R[5]),.M6R6(M6R[6]),.M6R7(M6R[7]),.M7Im0(M7Im[0]),.M7Im1(
		M7Im[1]),.M7Im2(M7Im[2]),.M7Im3(M7Im[3]),.M7Im4(M7Im[4]),.M7Im5(M7Im[5]),
		.M7Im6(M7Im[6]),.M7Im7(M7Im[7]),.M7R0(M7R[0]),.M7R1(M7R[1]),.M7R2(M7R[2]),
		.M7R3(M7R[3]),.M7R4(M7R[4]),.M7R5(M7R[5]),.M7R6(M7R[6]),.M7R7(M7R[7]),.M8Im0(
		M8Im[0]),.M8Im1(M8Im[1]),.M8Im2(M8Im[2]),.M8Im3(M8Im[3]),.M8Im4(M8Im[4]),
		.M8Im5(M8Im[5]),.M8Im6(M8Im[6]),.M8Im7(M8Im[7]),.M8R0(M8R[0]),.M8R1(M8R[1]),
		.M8R2(M8R[2]),.M8R3(M8R[3]),.M8R4(M8R[4]),.M8R5(M8R[5]),.M8R6(M8R[6]),.M8R7(
		M8R[7]));


endmodule
