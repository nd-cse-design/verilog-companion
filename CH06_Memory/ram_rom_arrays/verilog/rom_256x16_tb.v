module rom_256x16_tb ();
	reg 		[7:0] 	addr;
	reg 					clk;
	wire		[15:0]	dout;
	
	rom_256x16 uut (
	.addr	(addr),
	.clk	(clk),
	.dout	(dout)
	);
	
	always
		#5 clk = ~clk;
	
	initial begin
		clk = 0; addr = 0;
		#10 addr = 1;
		#10 addr = 2;
		#10 addr = 3;
		#10 $stop;
	end
	
endmodule
