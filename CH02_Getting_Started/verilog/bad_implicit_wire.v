module bad_implicit_wire (
	input		a,
	input		b,
	output	y
	);
	
	wire n0;
	
	assign y  = ~n0_misspelled;	// meant n0 but misspelled it!!!
	assign n0 = a & b;
	
endmodule

