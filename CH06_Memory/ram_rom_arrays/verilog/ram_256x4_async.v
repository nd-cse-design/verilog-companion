module ram_256x4_async (
	input 		[7:0] 	read_addr,
	input 		[7:0] 	write_addr,
	input 		[3:0] 	din,
	input 					clk,
	input 					we,
	output   	[3:0]	dout);
	
	reg [3:0] mem_array [0:255];
	
	always @(posedge clk)
		if (we)
			mem_array[write_addr] <= din;
   
   assign dout = mem_array[read_addr];
	
endmodule
