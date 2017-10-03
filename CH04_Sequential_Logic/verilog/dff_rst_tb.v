module dff_rst_tb ();
	reg clk;
	reg d;
   reg rst;
	wire q;
	
	dff_rst uut (
      .clk  (clk),
      .d    (d),
      .rst  (rst),
      .q    (q)
   );
	
	always
		#5 clk = ~clk;
	
	initial begin
		clk = 0; d = 1;  rst = 1;
		#10 rst = 0;
		#10;
		$stop;
	end
   
endmodule
