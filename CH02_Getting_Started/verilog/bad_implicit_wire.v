module bad_implicit_wire (
	input		a,
	input		b,
	output	y
	);
	
	wire n0;
	
	assign y  = ~n0;	
	assign n0_misspelled = a & b;	// meant n0 but misspelled it!!!
	
endmodule

