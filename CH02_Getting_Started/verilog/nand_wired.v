module nand_wired (
	input		a,
	input		b,
	output	y
	);
	
	wire n0;
	
	assign y  = ~n0;	
	assign n0 = a & b;
	
endmodule
