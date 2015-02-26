module mux2 # ( parameter SIZE=10 ) (a1,sel0,sel1,q0);
//% This module is a common 2 input multiplexor. 
//% Note the this is writen in non-RTL description but it can eventually be passed to RTL description.
	input a1;
	input signed [SIZE-1:0] sel0,sel1;
    output reg [SIZE-1:0] q0 ;
    
    
    always @(a1 or sel0 or sel1)  //Condicion de funcionamiento de un mux 2:1
    begin
		if(a1)
		 q0<= sel1;
		else
		 q0<= sel0;
	end
	
endmodule
