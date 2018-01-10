module mux4 (
	input d0, d1, d2, d3, 
	input [1:0] s,
	output reg f);
		
	always @(d0, d1, d2, d3, s)
		case (s)
			0: f = d0;
			1: f = d1;
			2: f = d2;
			3: f = d3;
		endcase
			
endmodule
