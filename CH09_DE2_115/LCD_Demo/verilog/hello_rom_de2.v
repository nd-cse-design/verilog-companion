module hello_rom_de2 (
	input          CLOCK_50,	//	50 MHz clock
	output         LCD_ON,		// LCD Power ON/OFF
	output         LCD_BLON,	// LCD Back Light ON/OFF
	output         LCD_RW,		// LCD Read/Write Select, 0 = Write, 1 = Read
	output         LCD_EN,		// LCD Enable
	output         LCD_RS,		// LCD Command/Data Select, 0 = Command, 1 = Data
	inout    [7:0] LCD_DATA		// LCD Data bus 8 bits
   );
   
   wire [4:0] lcd_index;
   wire [7:0] lcd_ascii;
   
   hello_rom hello_rom_0 (
      .addr    (lcd_index),
      .dout    (lcd_ascii)
   );
   
   LCD_Controller LCD_Controller_0 (
      .lcd_ascii  (lcd_ascii),
      .lcd_index  (lcd_index),
      .CLOCK_50   (CLOCK_50 ),
      .LCD_ON     (LCD_ON   ),	
      .LCD_BLON   (LCD_BLON ),
      .LCD_RW     (LCD_RW   ),	
      .LCD_EN     (LCD_EN   ),	
      .LCD_RS     (LCD_RS   ),	
      .LCD_DATA   (LCD_DATA )	
	);
   
endmodule
