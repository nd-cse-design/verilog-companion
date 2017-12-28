module fanout (
	input		a,
	input		b,
	output	y0,
	output	y1
	);
	
	wire n0;
	
	assign n0 = ~a;
	assign y0 = n0 & b;
	assign y1 = n0 ^ b;
	
endmodule

