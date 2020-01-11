module decoder_2x4_case (
	input [1:0] s,
	output reg [0:3] f  // bits in ascending order (for example)
	);
		
	always @(*)
		case (s)
			0: f = 4'b1000; 
			1: f = 4'b0100;
			2: f = 4'b0010;
			3: f = 4'b0001; 
		endcase
endmodule
