module mux4x4 (
	input [3:0] d0,
	input [3:0] d1,
	input [3:0] d2,
	input [3:0] d3,
	input [1:0] s,
	output reg [3:0] y
	);
	
	always @(*)
		case (s)
			0: y = d0;
			1: y = d1;
			2: y = d2;
			3: y = d3;
		endcase
		
endmodule
