module majority_case (
	input a, b, c,
	output reg f);
	
	always @(a, b, c)
		case({a, b, c})
			3'b000: f = 0;
			3'b001: f = 0;
			3'b010: f = 0;
			3'b011: f = 1;
			3'b100: f = 0;
			3'b101: f = 1;
			3'b110: f = 1;
			3'b111: f = 1;
		endcase
	
endmodule
