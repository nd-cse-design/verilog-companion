module vga_demo (
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
	
	vga_adapter VGA(
		.resetn		(KEY[1]),
		.clock		(CLOCK_50),
		.colour		(SW[2:0]),
		.x				(SW[17:10]),
		.y				(SW[9:3]),
		.plot			(~KEY[0]),
		/* Signals for the DAC to drive the monitor. */
		.VGA_R		(VGA_R),
		.VGA_G		(VGA_G),
		.VGA_B		(VGA_B),
		.VGA_HS		(VGA_HS),
		.VGA_VS		(VGA_VS),
		.VGA_BLANK	(VGA_BLANK),
		.VGA_SYNC	(VGA_SYNC),
		.VGA_CLK		(VGA_CLK)
	);
	defparam VGA.RESOLUTION = "160x120";
	defparam VGA.MONOCHROME = "FALSE";
	defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
	defparam VGA.BACKGROUND_IMAGE = "background_image.mif";
	
endmodule
