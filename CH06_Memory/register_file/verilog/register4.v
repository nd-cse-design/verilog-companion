module register4 (
	input [3:0] din,
	input ld,
	input clk,
	output reg [3:0] dout
	);
	
	always @(posedge clk)
		if (ld)
			dout <= din;

endmodule
