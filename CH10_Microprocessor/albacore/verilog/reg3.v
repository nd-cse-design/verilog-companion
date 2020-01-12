module reg3 (
	input 					clk,
	input						en,
	input 		[2:0]	   d,
	output reg	[2:0]	   q
   );
   
   initial q = 0;
	
	always @(posedge clk)
		if (en)
			q <= d;
			
endmodule
