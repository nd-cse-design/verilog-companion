module reg16 (
	input 					clk,
	input						en,
	input 		[15:0]	d,
	output reg	[15:0]	q
   );
   
   initial q = 0;
	
	always @(posedge clk)
		if (en)
			q <= d;
			
endmodule
