module mux_4x4_case ( 
	input [3:0] d0, d1, d2, d3,
	input [1:0] s,
	output reg [3:0] f); 
		
	always @(*)
		case (s)
			0: f = d0;
			1: f = d1;
			2: f = d2;
			3: f = d3;
		endcase
			
endmodule
