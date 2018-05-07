module rom_256x16_mif (
	input 		[7:0] 	addr,
	input 					clk,
	output reg	[15:0]	dout
	);
	
	// This is a synthesis attribute, but doesn't work for simulation
	(* ram_init_file = "rom_contents.mif" *)
	reg [15:0] mem_array [0:255];

	always @(posedge clk)
		dout <= mem_array[addr];
		
endmodule
