`timescale 1ns/1ns

module shiftreg22_tb();
	reg clk;
	reg d;
	wire [21:0] q;
	
	shiftreg22 uut (clk, d, q);
	
	always 
		#5 clk = ~clk;
	
	initial begin
		clk = 0;  d = 0;
		#10 d = 1;
		#10 d = 0;
		#10 d = 0;
		#10 d = 1;
		#10 d = 0;
		#10 d = 1;
		#10 d = 1;
		#10 d = 0;
		#10 $stop;
	end
	
endmodule