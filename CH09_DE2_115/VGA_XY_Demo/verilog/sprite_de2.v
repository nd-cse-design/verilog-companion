module sprite_de2 (
	input				CLOCK_50,				//	50 MHz
   input  [7:0]   SW,
	input	 [0:0]	KEY,
   output [17:0]  LEDR,
	output			VGA_CLK,   				//	VGA Clock
	output			VGA_HS,					//	VGA H_SYNC
	output			VGA_VS,					//	VGA V_SYNC
	output			VGA_BLANK,				//	VGA BLANK
	output			VGA_SYNC,				//	VGA SYNC
	output [9:0]	VGA_R,   				//	VGA Red[9:0]
	output [9:0]	VGA_G,	 				//	VGA Green[9:0]
	output [9:0]	VGA_B	   				//	VGA Blue[9:0]
	);
	
   wire [7:0] 	xvga;
	wire [6:0] 	yvga;
   wire [2:0]  color;
   
   assign LEDR [7:0] = SW[7:0];
   assign LEDR [17:8] = 0;
	
   sprite_test sprite_test (
      .VGA_CLK (VGA_CLK),
      .x       ({4'b0, SW[3:0]}),
      .y       ({3'b0, SW[7:4]}),
      .xvga    (xvga),
      .yvga    (yvga),
      .color   (color)
   );
   
   vga_xy_controller vga_xy_controller (
      .CLOCK_50      (CLOCK_50),
      .resetn        (KEY[0]),
      .color         (color),
      .x             (xvga),
      .y             (yvga),
      .VGA_R         (VGA_R),
      .VGA_G         (VGA_G),
      .VGA_B         (VGA_B),
      .VGA_HS        (VGA_HS),
      .VGA_VS        (VGA_VS),
      .VGA_BLANK     (VGA_BLANK),
      .VGA_SYNC      (VGA_SYNC),
      .VGA_CLK       (VGA_CLK)				
   );

endmodule
