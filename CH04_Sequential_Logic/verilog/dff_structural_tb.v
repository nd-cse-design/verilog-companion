`timescale 1ns/1ns
module dff_structural_tb ();
	reg d;
	reg clk;
	wire q;
	
	dff_structural uut (
		.clk	(clk),
		.d 	(d),
		.q		(q)
	);
	
	always
		#5 clk = ~clk;
	
	initial begin
		clk = 0; d = 0;
		#10 d = 1;
		#10 d = 0;
		#10;
		$stop;
	end
   
endmodule
