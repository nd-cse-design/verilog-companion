module hello_ram_de2 (
	input 				CLOCK_50,
	input 	[0:0] 	KEY,
	input 	[17:0] 	SW,
	output 	[6:0]		HEX4,HEX5,HEX6,HEX7,
	output 	[8:0] 	LEDG,
	output 	[17:0] 	LEDR,
   // LCD ports
	output 				LCD_ON,		// LCD Power ON/OFF
	output 				LCD_BLON,	// LCD Back Light ON/OFF
	output 				LCD_RW,		// LCD Read/Write Select, 0 = Write, 1 = Read
	output 				LCD_EN,		// LCD Enable
	output 				LCD_RS,		// LCD Command/Data Select, 0 = Command, 1 = Data
	inout [7:0] 		LCD_DATA		// LCD Data bus 8 bits
	);
   
   
   // Send used switches to red leds 
	assign LEDR[12:0] = SW[12:0];
	
	wire [4:0]	lcd_index;
	wire [4:0]	waddr = SW[12:8];
	wire [7:0]	lcd_char;
	wire [7:0]	din = SW[7:0];
	wire			we = ~KEY[0];
   
   hello_ram (
		.clk		(CLOCK_50),
		.raddr	(lcd_index),
		.din		(din),
		.waddr	(waddr),
		.we		(we),
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
   
   // blank unused LEDs
   assign LEDR[17:13] = 5'h0;
   assign LEDG[8:0]   = 9'h0;
   
endmodule
