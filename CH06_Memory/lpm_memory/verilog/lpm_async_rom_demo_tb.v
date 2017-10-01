`timescale 1ns/1ns
module lpm_async_rom_demo_tb ();
	reg 		[8:0] 	addr;
	wire		[15:0]	q;
	
	lpm_async_rom_demo uut (
	.addr			(addr),
	.q				(q)
	);
	
	
	initial begin
		addr = 0;
		#10 addr = 1;
		#10 addr = 2;
		#10 addr = 3;
		#50 $stop;
	end
	
endmodule
