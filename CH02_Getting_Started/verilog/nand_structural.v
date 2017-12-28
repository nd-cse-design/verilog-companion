module nand_structural (
	input		a,
	input		b,
	output	y
	);
	
	wire n0;
	
	my_and and0 (
		.a	(a),
		.b (b),
		.y (n0)
	);
	
	my_inv inv0 (
		.a	(n0),
		.y	(y)
	);
	
endmodule
