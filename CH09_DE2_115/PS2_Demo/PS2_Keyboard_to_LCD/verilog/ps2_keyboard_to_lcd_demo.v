module ps2_keyboard_to_lcd_demo (
	input					CLOCK_50,
	input		[3:0]		KEY,
	inout					PS2_CLK,
	inout					PS2_DAT,
	output	[6:0]		HEX0,
	output	[6:0]		HEX1,
	output	[17:0]	LEDR,
	output 				LCD_ON,		// LCD Power ON/OFF
	output 				LCD_BLON,	// LCD Back Light ON/OFF
	output 				LCD_RW,		// LCD Read/Write Select, 0 = Write, 1 = Read
	output 				LCD_EN,		// LCD Enable
	output 				LCD_RS,		// LCD Command/Data Select, 0 = Command, 1 = Data
	inout [7:0] 		LCD_DATA		// LCD Data bus 8 bits
	);


	wire		[7:0]	ps2_key_data;
	wire				ps2_key_en;
	wire				keycode_ready;
	wire		[7:0]	keycode;
	wire		[7:0]	ascii;
	wire 		[7:0]	disp_data;
	wire		[4:0]	lcd_raddr;
	wire				ext;
	wire				make;
	wire		[4:0]	lcd_waddr;

	assign LEDR[17:2] = 0;
	assign LEDR[1]		= ext;
	assign LEDR[0]		= make;
	
	assign	LCD_ON	=	1'b1;
	assign	LCD_BLON	=	1'b1;

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
   
   count5 lcd_addr_counter (
      .clk     (CLOCK_50),
      .reset   (~KEY[0]),
      .en      (keycode_ready & make),
      .q       (lcd_waddr)
   );
   
	LCD_ram (
		.clk		(CLOCK_50),
		.raddr	(lcd_raddr),
		.din		(ascii),
		.waddr	(lcd_waddr),
		.we		(keycode_ready & make),
		.dout		(disp_data)
	);
	
	wire DLY_RST;
	Reset_Delay r0 (
		.iCLK		(CLOCK_50),
		.oRESET	(DLY_RST)
	);
		
	LCD_Display u1(
	// Host Side
		.iCLK_50MHZ	(CLOCK_50),
		.iRST_N		(DLY_RST),
		.oMSG_INDEX	(lcd_raddr),
		.iMSG_ASCII	(disp_data),
	// LCD Side
		.DATA_BUS	(LCD_DATA),
		.LCD_RW		(LCD_RW),
		.LCD_E		(LCD_EN),
		.LCD_RS		(LCD_RS)
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
