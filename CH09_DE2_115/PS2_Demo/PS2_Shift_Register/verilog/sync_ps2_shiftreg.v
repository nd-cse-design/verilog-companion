module sync_ps2_shiftreg (
   input clk,
	input ps2_clk,
	input ps2_d,
	output [21:0] q);

   wire [2:0] ps2_clk_data;
   wire ps2_en = ~ps2_clk_data[1] & ps2_clk_data[0];

   shiftreg3      ps2_clk_shiftreg  (clk, ps2_clk, ps2_clk_data);
   shiftreg22_en  ps2_data_shiftreg (clk, ps2_en, ps2_d, q);
   

endmodule
