module keycode_recognizer_demo (
	input					CLOCK_50,
	input		[0:0]		KEY,
	inout					PS2_CLK,
	inout					PS2_DAT,
	output	[6:0]		HEX0,
	output	[6:0]		HEX1,
	output	[17:0]	LEDR
	);

	// Internal Wires
	wire		[7:0]	ps2_key_data;
	wire				ps2_key_en;
	wire				keycode_ready;
	wire		[7:0]	keycode;
	wire				ext;
	wire				make;

	assign LEDR[17:3] = 0;
   assign LEDR[2]    = keycode_ready;
	assign LEDR[1]		= ext;
	assign LEDR[0]		= make;
	

	PS2_Controller PS2 (
		// Inputs
		.CLOCK_50			(CLOCK_50),
		.reset				(~KEY[0]),

		// Bidirectionals
		.PS2_CLK				(PS2_CLK),
		.PS2_DAT				(PS2_DAT),

		// Outputs
		.received_data		(ps2_key_data),
		.received_data_en	(ps2_key_en)
	);

	keycode_recognizer (
		.clk					(CLOCK_50),
		.reset_n				(KEY[0]),
		.ps2_key_en			(ps2_key_en),
		.ps2_key_data		(ps2_key_data),
		.keycode				(keycode),
		.ext					(ext),
		.make					(make),
		.keycode_ready		(keycode_ready)
	);
	


	hexdigit digit1 (
		.in					(keycode[7:4]),
		.out					(HEX1)
	);

	hexdigit digit0 (
		.in					(keycode[3:0]),
		.out					(HEX0)
	);
	

endmodule
