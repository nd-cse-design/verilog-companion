module obstacle_DE2 (
	input				CLOCK_50,				//	50 MHz
	input	 [0:0]	KEY,
	output			VGA_CLK,   				//	VGA Clock
	output			VGA_HS,					//	VGA H_SYNC
	output			VGA_VS,					//	VGA V_SYNC
	output			VGA_BLANK,				//	VGA BLANK
	output			VGA_SYNC,				//	VGA SYNC
	output [9:0]	VGA_R,   				//	VGA Red[9:0]
	output [9:0]	VGA_G,	 				//	VGA Green[9:0]
	output [9:0]	VGA_B	   				//	VGA Blue[9:0]
	);
	
	wire [2:0] 	plot_color;
	wire [7:0] 	x_proc;
	wire [6:0] 	y_proc;
   wire [7:0] 	x_vga;
	wire [6:0] 	y_vga;
	wire		  	plot;
   wire [2:0]  image_color;
   wire [2:0]  vga_color;
	
	processor processor (
		.clk		      (CLOCK_50),
		.reset	      (~KEY[0]),
		.x		         (x_proc),
		.y		         (y_proc),
		.plot_color	   (plot_color),
		.plot		      (plot),
      .image_color   (image_color)
	);
   
   image_ram image_ram (
      .wren          (plot),  
      .clk_proc      (CLOCK_50),   
      .clk_vga       (VGA_CLK),    			
      .x_proc        (x_proc),
      .y_proc        (y_proc),
      .x_vga         (x_vga),
      .y_vga         (y_vga),
      .din           (plot_color),   
      .dout_proc     (image_color),   
      .dout_vga      (vga_color)
   );
   defparam image_ram.IMAGE_FILE = "obstacle_course.mem";
   
   vga_xy_controller vga_xy_controller (
      .CLOCK_50      (CLOCK_50),
      .resetn        (KEY[0]),
      .color         (vga_color),
      .x             (x_vga),
      .y             (y_vga),
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
