module nand_simple (
	input		a,
	input		b,
	output	y
	);
	
	assign y = ~(a & b);
	
endmodule
