module reg8 (
	input 					clk,
	input						en,
	input 		[7:0]	   d,
	output reg	[7:0]	   q
   );
   
   initial q = 0;
	
	always @(posedge clk)
		if (en)
			q <= d;
			
endmodule
