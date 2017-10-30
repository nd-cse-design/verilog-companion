module image_ram (
	clk,
	x_read,
	y_read,
	color_out,
	x_write,
	y_write,
	color_in,
	wren);

	// parameters
	parameter RESOLUTION = "160x120";
	parameter BITS_PER_COLOUR_CHANNEL = 1;
	parameter MONOCHROME = "FALSE";
	parameter BACKGROUND_IMAGE = "test.mif";
	
	// declare inputs and outputs
	input 			clk;
	input 	[7:0]	x_read;
	input 	[6:0]	y_read;
	output 	[2:0]	color_out;
	input 	[7:0]	x_write;
	input 	[6:0]	y_write;
	input 	[2:0]	color_in;
	input				wren;
	
	// internal wires
	wire [14:0] raddr;
	wire [14:0] waddr;
	
	// module instances
	vga_address_translator read_translator (
		.x(x_read), 
		.y(y_read), 
		.mem_address(raddr) 
	);
	defparam read_translator.RESOLUTION = RESOLUTION;
	
//	vga_address_translator write_translator (
//		.x(x_write), 
//		.y(y_write), 
//		.mem_address(waddr) 
//	);
//	defparam write_translator.RESOLUTION = "160x120";
	
	/**/
	lpm_ram_dq ImageMemory (
		.data			(color_in),
		.address		(raddr),
		.inclock		(clk),
//		.outclock	(clk),
		.we			(wren),
		.q				(color_out)
	);
	defparam ImageMemory.lpm_width		= 3;
	defparam ImageMemory.lpm_widthad		= 15;
	defparam ImageMemory.lpm_numwords	= 19200;
	defparam ImageMemory.lpm_outdata		= "UNREGISTERED";
	defparam ImageMemory.lpm_file			= BACKGROUND_IMAGE;
	/**/
	
	
	/**
	altsyncram	ImageMemory (
				.wren_a 		(wren),
				.wren_b 		(1'b0),
				.clock0 		(clk), 		// write clock
				.clock1 		(clk), 		// read clock
				.clocken0 	(1'b1), 		// write enable clock
				.clocken1 	(1'b1), 		// read enable clock				
				.address_a 	(waddr),
				.address_b 	(raddr),
				.data_a 		(color_in), // data in
				.q_b 			(color_out)	// data out
				);
	defparam
		ImageMemory.WIDTH_A = ((MONOCHROME == "FALSE") ? (BITS_PER_COLOUR_CHANNEL*3) : 1),
		ImageMemory.WIDTH_B = ((MONOCHROME == "FALSE") ? (BITS_PER_COLOUR_CHANNEL*3) : 1),
		ImageMemory.INTENDED_DEVICE_FAMILY = "Cyclone II",
		ImageMemory.OPERATION_MODE = "DUAL_PORT",
		ImageMemory.WIDTHAD_A = ((RESOLUTION == "320x240") ? (17) : (15)),
		ImageMemory.NUMWORDS_A = ((RESOLUTION == "320x240") ? (76800) : (19200)),
		ImageMemory.WIDTHAD_B = ((RESOLUTION == "320x240") ? (17) : (15)),
		ImageMemory.NUMWORDS_B = ((RESOLUTION == "320x240") ? (76800) : (19200)),
		ImageMemory.OUTDATA_REG_B = "CLOCK1",
		ImageMemory.ADDRESS_REG_B = "CLOCK1",
		ImageMemory.CLOCK_ENABLE_INPUT_A = "BYPASS",
		ImageMemory.CLOCK_ENABLE_INPUT_B = "BYPASS",
		ImageMemory.CLOCK_ENABLE_OUTPUT_B = "BYPASS",
		ImageMemory.POWER_UP_UNINITIALIZED = "FALSE",
		ImageMemory.INIT_FILE = BACKGROUND_IMAGE;
	**/
	
	/**
	altsyncram	ImageMemory (
				.wren_a 		(wren),
				.wren_b 		(1'b0),
				.clock0 		(clk), 		// write clock
				.clock1 		(clk), 		// read clock
				.clocken0 	(1'b1), 		// write enable clock
				.clocken1 	(1'b1), 		// read enable clock				
				.address_a 	(waddr),
				.address_b 	(raddr),
				.data_a 		(color_in), // data in
				.q_b 			(color_out)	// data out
				);
	defparam
		ImageMemory.width_a = ((MONOCHROME == "FALSE") ? (BITS_PER_COLOUR_CHANNEL*3) : 1),
		ImageMemory.width_b = ((MONOCHROME == "FALSE") ? (BITS_PER_COLOUR_CHANNEL*3) : 1),
		ImageMemory.intended_device_family = "Cyclone II",
		ImageMemory.operation_mode = "DUAL_PORT",
		ImageMemory.widthad_a = ((RESOLUTION == "320x240") ? (17) : (15)),
		ImageMemory.numwords_a = ((RESOLUTION == "320x240") ? (76800) : (19200)),
		ImageMemory.widthad_b = ((RESOLUTION == "320x240") ? (17) : (15)),
		ImageMemory.numwords_b = ((RESOLUTION == "320x240") ? (76800) : (19200)),
		ImageMemory.outdata_reg_b = "CLOCK1",
		ImageMemory.address_reg_b = "CLOCK1",
		ImageMemory.clock_enable_input_a = "BYPASS",
		ImageMemory.clock_enable_input_b = "BYPASS",
		ImageMemory.clock_enable_output_b = "BYPASS",
		ImageMemory.power_up_uninitialized = "FALSE",
		ImageMemory.init_file = BACKGROUND_IMAGE;
	**/
	
endmodule
