`timescale 1ns/1ns

module processor_tb ();
   reg            clk;
   reg            reset;
   wire	[7:0]		xpos;
   wire	[6:0]		ypos;
   wire	[2:0]		color;
   wire           plot;

	processor uut (
		.clk		(clk	),
		.reset	(reset),
		.xpos		(xpos	),
		.ypos		(ypos	),
		.color	(color),
		.plot 	(plot )
   );
	
	always #5 clk = ~clk;
	
	initial begin
		clk = 0;  reset = 1;
		#10 reset = 0;
		#10000 $stop;
	end
	
endmodule
