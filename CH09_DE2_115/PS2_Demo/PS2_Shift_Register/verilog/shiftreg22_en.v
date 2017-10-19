module shiftreg22_en (
	input clk,
   input en,
	input d,
	output reg [21:0] q);
	
	always @(negedge clk)
      if (en)
         q <= {d, q[21:1]};
	
endmodule
