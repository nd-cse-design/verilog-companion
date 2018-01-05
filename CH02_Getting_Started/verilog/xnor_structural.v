module xnor_structural (
	input		a,
	input		b,
	output	y
	);
	
	wire n0;
	
	xor_structural xor0 (
		.a	(a),
		.b (b),
		.y (n0)
	);
	
	my_inv my_inv0 (
		.a	(n0),
		.y	(y)
	);
	
endmodule
