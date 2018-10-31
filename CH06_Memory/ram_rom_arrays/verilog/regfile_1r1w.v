module regfile_1r1w (
	input [1:0] raddr,
	input [1:0] waddr,
	input [3:0] din,
	input wren,
	input clk,
	output [3:0] dout
	);
	
	wire [0:3] ld;
	wire [3:0] dout0, dout1, dout2, dout3;
	
	register4 register4_0 (
	.din		(din),
	.ld		(ld[0]),
	.clk		(clk),
	.dout	   (dout0)
	);

	register4 register4_1 (
	.din		(din),
	.ld		(ld[1]),
	.clk		(clk),
	.dout	   (dout1)
	);
   
   register4 register4_2 (
	.din		(din),
	.ld		(ld[2]),
	.clk		(clk),
	.dout	   (dout2)
	);

	register4 register4_3 (
	.din		(din),
	.ld		(ld[3]),
	.clk		(clk),
	.dout	   (dout3)
	);
	
	demux4 demux4_0 (
	.s		   (waddr),
	.en	   (wren),
	.y		   (ld)
	);
	
	mux4x4 mux4x4_0 (
	.d0		(dout0),
	.d1		(dout1),
	.d2		(dout2),
	.d3		(dout3),
	.s		   (raddr),
	.y		   (dout)
	);
	
endmodule
