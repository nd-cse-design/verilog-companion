module lcd_ram_top (
	input 				CLOCK_50,	//	50 MHz clock
	input 	[3:0] 	KEY,      	//	Pushbutton[0]
	input 	[17:0] 	SW,			//	Toggle Switch[17:0]
	output 	[6:0]		HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,  // Seven Segment Digits
	output 	[8:0] 	LEDG,  		//	LED Green
	output 	[17:0] 	LEDR,  		//	LED Red

	//LCD Module 16X2
	output 				LCD_ON,		// LCD Power ON/OFF
	output 				LCD_BLON,	// LCD Back Light ON/OFF
	output 				LCD_RW,		// LCD Read/Write Select, 0 = Write, 1 = Read
	output 				LCD_EN,		// LCD Enable
	output 				LCD_RS,		// LCD Command/Data Select, 0 = Command, 1 = Data
	inout [7:0] 		LCD_DATA		// LCD Data bus 8 bits
	);
   
   
   wire DLY_RST;

	// reset delay gives some time for peripherals to initialize
   Reset_Delay r0 (
      .iCLK		(CLOCK_50),
      .oRESET	(DLY_RST)
	);
   
   // Send used switches to red leds 
	assign LEDR[12:0] = SW[12:0];

	// turn LCD ON
	assign	LCD_ON	=	1'b1;
	assign	LCD_BLON	=	1'b1;
	
	wire [4:0]	disp_addr;
	wire [4:0]	waddr = SW[12:8];
	wire [7:0]	disp_data;
	wire [7:0]	din = SW[7:0];
	wire			we = ~KEY[0];
   
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
  
   hexdigit addr1(
      .in         ({3'b0, waddr[4]}),
      .out        (HEX7)
   );
   
   hexdigit addr0(
      .in         (waddr[3:0]),
      .out        (HEX6)
   );
   
   hexdigit data1(
      .in         (din[7:4]),
      .out        (HEX5)
   );
   
   hexdigit data0(
      .in         (din[3:0]),
      .out        (HEX4)
   );
   
   // blank unused LEDs and 7-segment digits
   assign LEDR[17:13] = 5'h0;
   assign LEDG[8:0]   = 9'h0;
	assign HEX0 = 7'b111_1111;
	assign HEX1 = 7'b111_1111;
	assign HEX2 = 7'b111_1111;
	assign HEX3 = 7'b111_1111;
   
endmodule
