module dff_structural (
	input		clk,
	input		d,
	output	q
	);
	
	wire	n;
	wire	clkb = ~clk;
	
	my_dlatch flip (
		.d		(d),
		.en	(clkb),
		.q		(n)
	);
	
	my_dlatch flop (
		.d		(n),
		.en	(clk),
		.q		(q)
	);
	
endmodule
