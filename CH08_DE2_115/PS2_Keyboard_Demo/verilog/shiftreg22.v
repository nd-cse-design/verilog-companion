module shiftreg22 (
	input clk,
	input d,
	output reg [21:0] q);
	
	always @(negedge clk)
		q <= {d, q[21:1]};
	
endmodule
