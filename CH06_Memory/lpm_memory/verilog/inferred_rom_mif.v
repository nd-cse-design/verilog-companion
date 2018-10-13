module inferred_rom_mif (
	input 	   [7:0] 	addr,
	input 				   clock,
	output reg  [15:0] 	q);
   
   // note init directive is for synthesis, doesn't simulate!!!
   (* ram_init_file = "verilog/rom_contents.mif" *) reg [15:0] M [0:255];
   
   always @(posedge clock)
      q <= M[addr];
      
endmodule
