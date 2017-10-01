`timescale 1ns/1ns

module regfile_1r1w_tb ();
	reg [1:0] raddr;
	reg [1:0] waddr;
	reg [3:0] din;
	reg wren;
	reg clk;
	wire [3:0] dout;
	
	
	regfile_1r1w uut (
	.raddr	(raddr),
	.waddr	(waddr),
	.din		(din),
	.wren	(wren),
	.clk		(clk),
	.dout	(dout)
	);

   always
		#5 clk = ~clk;
	
	initial begin
		clk = 0; wren = 1;
		// write to each register and 
		// read on next cycle
		#10 raddr = 0; waddr = 0; din = 4'hA;
		#10 raddr = 0; waddr = 1; din = 4'hB;
		#10 raddr = 1; waddr = 2; din = 4'hC;
		#10 raddr = 2; waddr = 3; din = 4'hD;

		// disable wren and read back reg3
		#10 raddr = 3; waddr = 0; din = 0; 
			wren = 0;

		// read back reg0 and make sure 
		// it didn't change
		#10 raddr = 0;
		#10 $stop;
	end
	
endmodule
