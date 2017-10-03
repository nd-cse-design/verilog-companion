`timescale 1ns/1ns

module dff_en_tb ();
	reg clk;
	reg d;
   reg en;
	wire q;
	
	dff_en uut (
      .clk  (clk),
      .d    (d),
      .en   (en),
      .q    (q)
   );
	
	always
		#5 clk = ~clk;
	
	initial begin
		clk = 0; d = 0;  en = 1;
		#10 d = 1;  en = 0;
		#10 en = 1;
      #10
		$stop;
	end
   
endmodule
