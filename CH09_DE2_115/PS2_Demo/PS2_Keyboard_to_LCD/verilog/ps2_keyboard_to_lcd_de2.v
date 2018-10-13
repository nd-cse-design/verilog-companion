module ps2_keyboard_to_lcd_de2 (
	input					CLOCK_50,
	input		[0:0]		KEY,
	inout					PS2_CLK,
	inout					PS2_DAT,
	output	[6:0]		HEX0,
	output	[6:0]		HEX1,
	output	[17:0]	LEDR,
	output 				LCD_ON,		
	output 				LCD_BLON,	
	output 				LCD_RW,		
	output 				LCD_EN,		
	output 				LCD_RS,		
	inout [7:0] 		LCD_DATA	
	);


	wire		[7:0]	ps2_key_data;
	wire				ps2_key_en;
	wire				keycode_ready;
	wire		[7:0]	keycode;
	wire		[7:0]	ascii;
	wire 		[7:0]	lcd_char;
	wire		[4:0]	lcd_index;
	wire				ext;
	wire				make;
	wire		[4:0]	waddr;

	assign LEDR[17:2] = 0;
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
      .reset_n          (KEY[0]),
		.ps2_key_en			(ps2_key_en),
		.ps2_key_data		(ps2_key_data),
		.keycode				(keycode),
		.ext					(ext),
		.make					(make),
		.keycode_ready		(keycode_ready)
	);
   
   count5 lcd_addr_counter (
      .clk     (CLOCK_50),
      .reset   (~KEY[0]),
      .en      (keycode_ready & make),
      .q       (waddr)
   );
   
	LCD_ram (
		.clk		(CLOCK_50),
		.raddr	(lcd_index),
		.din		(ascii),
		.waddr	(waddr),
		.we		(keycode_ready & make),
		.dout		(lcd_char)
	);
	
	LCD_Controller LCD_Controller_0 (
      .lcd_char   (lcd_char),
      .lcd_index  (lcd_index),
      .CLOCK_50   (CLOCK_50 ),
      .LCD_ON     (LCD_ON   ),	
      .LCD_BLON   (LCD_BLON ),
      .LCD_RW     (LCD_RW   ),	
      .LCD_EN     (LCD_EN   ),	
      .LCD_RS     (LCD_RS   ),	
      .LCD_DATA   (LCD_DATA )	
	);

	keycode_to_ascii (
		.keycode				(keycode),
		.ascii				(ascii)
	);

	hexdigit digit1 (
		.in					(ascii[7:4]),
		.out					(HEX1)
	);

	hexdigit digit0 (
		.in					(ascii[3:0]),
		.out					(HEX0)
	);

	

endmodule
