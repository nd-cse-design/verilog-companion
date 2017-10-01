module lpm_async_rom_demo (
	input 	[7:0] 	addr,
	output 	[15:0] 	q);
	
	lpm_rom rom (
		.address		(addr),
		.q				(q)
	);
	defparam rom.lpm_width 				= 16;
	defparam rom.lpm_widthad 			= 8;
	defparam rom.lpm_address_control	= "UNREGISTERED";
	defparam rom.lpm_outdata 			= "UNREGISTERED";
	defparam rom.lpm_file 				= "rom_contents.mif";
	
endmodule
