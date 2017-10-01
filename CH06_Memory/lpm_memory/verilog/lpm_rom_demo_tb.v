`timescale 1ns/1ns
module lpm_rom_demo_tb ();
	reg 		[8:0] 	addr;
	reg 					clock;
	wire		[15:0]	q;
	
	lpm_rom_demo uut (
	.addr			(addr),
	.clock		(clock),
	.q				(q)
	);
	
	always
		#5 clock = ~clock;
	
	initial begin
		clock = 0; addr = 0;
		#10 addr = 1;
		#10 addr = 2;
		#10 addr = 3;
		#50 $stop;
	end
	
endmodule
