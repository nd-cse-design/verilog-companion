module regfile_1r1w_behav (
	input				clk,
	input				wren,
	input  [7:0]	din,
	input  [3:0]	raddr,
	input  [3:0]	waddr,
	output [7:0]	dout
	);
	
	reg [7:0] reg_array [0:15];
	
	// write process
	always @(posedge clk)
		if (wren)
			reg_array[waddr] <= din;
	
	// read process
	assign dout = reg_array[raddr];
	
endmodule
