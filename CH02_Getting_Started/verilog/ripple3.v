module ripple3(
	input [2:0] a,
	input [2:0] b, 
	output [2:0] s,
	output cout);
	
	wire [1:0] c;

	full_adder fa0 (
		.a		(a[0]),
		.b		(b[0]),
		.cin	(0),
		.s		(s[0]),
		.cout	(c[0])
	);
	
	full_adder fa1 (
		.a		(a[1]),
		.b		(b[1]),
		.cin	(c[0]),
		.s		(s[1]),
		.cout	(c[1])
	);
	
	full_adder fa2 (
		.a		(a[2]),
		.b		(b[2]),
		.cin	(c[1]),
		.s		(s[2]),
		.cout	(cout)
	);
	
endmodule
