module mux_2x1 (
	input a, b, s,
	output reg f
	);
	
	always @(a, b, s)
		if (s)
			f = b;
		else
			f = a;
			
endmodule
