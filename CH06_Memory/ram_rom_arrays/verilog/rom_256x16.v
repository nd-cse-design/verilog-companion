module rom_256x16 (
	input 		[7:0] 	addr,
	input 					clk,
	output reg	[15:0]	dout
	);
	
	reg [15:0] mem_array [0:255];
	
	integer i;	
	initial begin
		for (i = 0;  i < 256;  i = i + 1)
			mem_array[i] = 0;
			
		mem_array[0] = 16'haaaa;
		mem_array[1] = 16'hbbbb;
		mem_array[2] = 16'hcccc;
		mem_array[3] = 16'hdddd;
	end
	
	always @(posedge clk)
		dout <= mem_array[addr];
		
endmodule
