module async_rom_256x16_tb ();
	reg 		[7:0] 	addr;
	wire		[15:0]	dout;
	
	async_rom_256x16 uut (
	.addr	(addr),
	.dout	(dout)
	);
	
	initial begin
		addr = 0;
		#10 addr = 1;
		#10 addr = 2;
		#10 addr = 3;
		#10 $stop;
	end
	
endmodule
