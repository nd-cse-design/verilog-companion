module regfile_2r1w_behav (
	input				clk,
	input				wren,
	input  [7:0]	din,
	input  [3:0]	raddr_a,
	input  [3:0]	raddr_b,
	input  [3:0]	waddr,
	output [7:0]	dout_a,
	output [7:0]	dout_b
	);
	
	reg [7:0] reg_array [0:15];
	
	always @(posedge clk)
		if (wren)
			reg_array[waddr] <= din;
	
	assign dout_a = reg_array[raddr_a];
	assign dout_b = reg_array[raddr_b];
	
endmodule
