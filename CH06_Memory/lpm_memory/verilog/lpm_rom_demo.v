module lpm_rom_demo (
	input 	[7:0] 	addr,
	input 				clock,
	output 	[15:0] 	q);
	
	lpm_rom rom (
		.address		(addr),
		.inclock		(clock),
		.q				(q)
	);
	defparam rom.lpm_width = 16;
	defparam rom.lpm_widthad = 8;
	defparam rom.lpm_outdata = "UNREGISTERED";
	defparam rom.lpm_file = "rom_contents.mif";
	
endmodule
