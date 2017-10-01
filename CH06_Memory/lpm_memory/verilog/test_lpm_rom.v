module test_lpm_rom (
	input [8:0] addr,
	input clock,
	output [15:0] q);
	
	lpm_rom0 ROMc3 (
		.address (addr),
		.clock (clock),
		.q (q));
		defparam ROMc3.lpm_file="sinc3.mif";

endmodule
