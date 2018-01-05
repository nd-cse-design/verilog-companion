module xnor_shorthand (
	input		a,
	input		b,
	output	y
	);
	
	wire n0;
	
	xor_structural xor0 (a, b, n0);
//	shorthand for:
//	xor_structural xor0 (
//		.a	(a),
//		.b (b),
//		.y (n0)
//	);
	
	my_inv inv0 (n0, y);
//	shorthand for:
//	my_inv inv0 (
//		.a	(n0),
//		.y	(y)
//	);
	
endmodule
