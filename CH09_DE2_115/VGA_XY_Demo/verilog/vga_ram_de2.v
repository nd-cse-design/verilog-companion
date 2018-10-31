module vga_ram_de2 (
	input				CLOCK_50,				//	50 MHz
	input	 [17:0]	SW,
	input	 [3:0]	KEY,
	output [17:0]	LEDR,
	output [7:0]	LEDG,
	output [6:0]	HEX0,
	output [6:0]	HEX1,
	output [6:0]	HEX2,
	output [6:0]	HEX3,
	output [6:0]	HEX4,
	output [6:0]	HEX5,
	output [6:0]	HEX6,
	output [6:0]	HEX7,
	output			VGA_CLK,   				//	VGA Clock
	output			VGA_HS,					//	VGA H_SYNC
	output			VGA_VS,					//	VGA V_SYNC
	output			VGA_BLANK,				//	VGA BLANK
	output			VGA_SYNC,				//	VGA SYNC
	output [9:0]	VGA_R,   				//	VGA Red[9:0]
	output [9:0]	VGA_G,	 				//	VGA Green[9:0]
	output [9:0]	VGA_B	   				//	VGA Blue[9:0]
	);
   
   wire   [7:0]   x_vga;
   wire   [6:0]   y_vga;
   wire   [2:0]   color_vga;
		
	assign LEDR = SW;
	assign LEDG	= 0;
	assign HEX1 = 7'h7f, HEX2 = 7'h7f, HEX3 = 7'h7f;
	
	hexdigit x1 (
		.in	(SW[17:14]),
		.out	(HEX7)
	);
	
	hexdigit x0 (
		.in	(SW[13:10]),
		.out	(HEX6)
	);
	
	hexdigit y1 (
		.in	({1'b0, SW[9:7]}),
		.out	(HEX5)
	);
	
	hexdigit y0 (
		.in	(SW[6:3]),
		.out	(HEX4)
	);
	
	hexdigit color (
		.in	({1'b0, SW[2:0]}),
		.out	(HEX0)
	);
   
   image_ram_1r1w image_ram ( 
      .CLOCK_50   (CLOCK_50),
      .VGA_CLK    (VGA_CLK),
      .we         (~KEY[1]),
      .din        (SW[2:0]),
      .xw         (SW[17:10]),
      .yw         (SW[9:3]),
      .xr         (x_vga),
      .yr         (y_vga),  
      .dout       (color_vga)
   );
	
	vga_xy_controller vga_xy_controller (
      .CLOCK_50      (CLOCK_50),
      .resetn        (KEY[0]),
      .color         (color_vga),
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
