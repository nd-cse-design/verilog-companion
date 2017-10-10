module shiftreg3 (
	input clk,
	input d,
	output reg [2:0] q);
	
	always @(negedge clk)
		q <= {d, q[2:1]};
	
endmodule
