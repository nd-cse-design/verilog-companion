module xor_primitives (
	input a,
	input b,
	output f
	);
	
	wire n0, n1, n2, n3;
	
	not not_0 (n0, a);
	not not_1 (n1, b);
	and and_0 (n2, a, n1);
	and and_1 (n3, n0, b);
	or  or_0  (f, n2, n3);
	
endmodule
