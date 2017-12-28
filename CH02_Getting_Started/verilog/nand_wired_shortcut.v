module nand_wired_shortcut (
	input		a,
	input		b,
	output	y
	);
	
	wire	 n0 = a & b;	// declare wire and assign expression to it
	assign y  = ~n0;
	
endmodule
