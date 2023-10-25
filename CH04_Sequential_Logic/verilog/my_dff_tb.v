`timescale 1ns/1ns
module my_dff_tb ();
	reg d;
	reg clk;
	wire q;
	
	my_dff uut (
    .d   (d), 
    .clk (clk), 
    .q   (q)
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
