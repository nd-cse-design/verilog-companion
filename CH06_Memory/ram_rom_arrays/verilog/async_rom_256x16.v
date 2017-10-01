module async_rom_256x16 (
	input 		[7:0] 	addr,
	output 		[15:0]	dout
	);
	
	reg [15:0] mem_array [0:255];
		initial begin
		mem_array[0] = 16'haaaa;
		mem_array[1] = 16'hbbbb;
		mem_array[2] = 16'hcccc;
		mem_array[3] = 16'hdddd;
	end
	
	assign dout = mem_array[addr];
		
endmodule
