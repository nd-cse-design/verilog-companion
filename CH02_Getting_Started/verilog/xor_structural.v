module xor_structural (
	input		a,
	input		b,
	output	y
	);
	
	wire n0, n1, n2, n3;
	
	my_inv inv0 (
		.a	(a),
		.y	(n1)
	);
	
	my_inv inv1 (
		.a	(b),
		.y	(n0)
	);
	
	my_and and0 (
		.a	(a),
		.b	(n0),
		.y	(n2)
	);
	
	my_and and1 (
		.a	(n1),
		.b	(b),
		.y	(n3)
	);
	
	my_or or0 (
		.a	(n2),
		.b	(n3),
		.y	(y)
	);
	
endmodule