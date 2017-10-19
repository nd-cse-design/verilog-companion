module keyboard_lcd (
	input 				CLOCK_50,	//	50 MHz clock
	input 	[3:0] 	KEY,      	//	Pushbutton[3:0]
	input 	[17:0] 	SW,			//	Toggle Switch[17:0]
	output 	[6:0]		HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,  // Seven Segment Digits
	output 	[8:0] 	LEDG,  		//	LED Green
	output 	[17:0] 	LEDR,  		//	LED Red
	inout 	[35:0] 	GPIO_0,GPIO_1,	//	GPIO Connections
	// PS2 Keyboard
	input					PS2_DAT,
	input					PS2_CLK,
	//LCD Module 16X2
	output 				LCD_ON,		// LCD Power ON/OFF
	output 				LCD_BLON,	// LCD Back Light ON/OFF
	output 				LCD_RW,		// LCD Read/Write Select, 0 = Write, 1 = Read
	output 				LCD_EN,		// LCD Enable
	output 				LCD_RS,		// LCD Command/Data Select, 0 = Command, 1 = Data
	inout [7:0] 		LCD_DATA		// LCD Data bus 8 bits
	);

	//	All inout port turn to tri-state
	assign	GPIO_0		=	36'hzzzzzzzzz;
	assign	GPIO_1		=	36'hzzzzzzzzz;

	wire [6:0] myclock;
	wire RST;
	assign RST = KEY[0];

	// reset delay gives some time for peripherals to initialize
	wire DLY_RST;
	Reset_Delay r0 (
	.iCLK		(CLOCK_50),
	.oRESET	(DLY_RST)
	);

	// Send switches to red leds 
	assign LEDR[17:4] = 0;

	// turn LCD ON
	assign	LCD_ON	=	1'b1;
	assign	LCD_BLON	=	1'b1;
	
	wire [4:0]	disp_addr;
	wire [4:0]	waddr;
	wire [7:0]	disp_data;
	wire [7:0]	din;
	wire			we;
	
	lcd_test_fsm (
		.clk			(CLOCK_50),
		.reset_n		(DLY_RST),
		.addr			(waddr),
		.ascii_char	(din),
		.en			(we)
	);

	LCD_ram (
		.clk		(CLOCK_50),
		.raddr	(disp_addr),
		.din		(din),
		.waddr	(waddr),
		.we		(we),
		.dout		(disp_data)
	);
		
	LCD_Display u1(
	// Host Side
		.iCLK_50MHZ	(CLOCK_50),
		.iRST_N		(DLY_RST),
		.oMSG_INDEX	(disp_addr),
		.iMSG_ASCII	(disp_data),
	// LCD Side
		.DATA_BUS	(LCD_DATA),
		.LCD_RW		(LCD_RW),
		.LCD_E		(LCD_EN),
		.LCD_RS		(LCD_RS)
	);
	
	wire [7:0] scan_code;
	wire read, scan_ready;
	wire [7:0] keycode;

	keyboard kbd(
		.keyboard_clk	(PS2_CLK),
		.keyboard_data	(PS2_DAT),
		.clock50			(CLOCK_50),
		.reset			(~DLY_RST),
		.read				(read),
		.scan_ready		(scan_ready),
		.scan_code		(scan_code)
	);

	keycode_recognizer (
		.clk				(CLOCK_50),
		.reset_n			(DLY_RST),
		.read				(~KEY[1]),
		.scan_ready		(scan_ready),
		.scan_code		(scan_code),
		.keyboard_read	(read),
		.keycode			(keycode),
		.ext				(LEDR[2]),
		.make				(LEDR[1]),
		.keycode_ready	(LEDR[0])
	);
	
	hexdigit keycode_1	(
		.in				(keycode[7:4]),
		.out				(HEX1)
	);
	
	hexdigit keycode_0	(
		.in				(keycode[3:0]),
		.out				(HEX0)
	);
	
	assign LEDR[3] = scan_ready;

	// blank unused 7-segment digits
//	assign HEX0 = 7'b111_1111;
//	assign HEX1 = 7'b111_1111;
	assign HEX2 = 7'b111_1111;
	assign HEX3 = 7'b111_1111;
	assign HEX4 = 7'b111_1111;
	assign HEX5 = 7'b111_1111;
	assign HEX6 = 7'b111_1111;
	assign HEX7 = 7'b111_1111;

endmodule