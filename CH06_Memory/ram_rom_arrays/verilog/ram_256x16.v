module ram_256x16 (
	input 		[7:0] 	read_addr,
	input 		[7:0] 	write_addr,
	input 		[15:0] 	din,
	input 					clk,
	input 					we,
	output reg	[15:0]	dout);
	
	reg [15:0] mem_array [0:255];
	
	always @(posedge clk) begin
		if (we)
			mem_array[write_addr] <= din;
		dout <= mem_array[read_addr]; // dout doesn't get din in this clock cycle
	end
	
endmodule
