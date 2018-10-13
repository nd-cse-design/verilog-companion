module mixed_message_de2 (
   input    [7:0]    SW,         // Switches
   output   [17:0]   LEDR,
	input             CLOCK_50,	//	50 MHz clock
	output            LCD_ON,		// LCD Power ON/OFF
	output            LCD_BLON,	// LCD Back Light ON/OFF
	output            LCD_RW,		// LCD Read/Write Select, 0 = Write, 1 = Read
	output            LCD_EN,		// LCD Enable
	output            LCD_RS,		// LCD Command/Data Select, 0 = Command, 1 = Data
	inout    [7:0]    LCD_DATA		// LCD Data bus 8 bits
   );
   
   wire [4:0] lcd_index;
   wire [7:0] lcd_char;
   
   assign LEDR[17:8] = 0;
   assign LEDR[7:0]  = SW[7:0];
   
   mixed_message mixed_message_0 (
      .addr    (lcd_index),
      .din     (SW[7:0]),
      .dout    (lcd_char)
   );
   
   LCD_Controller LCD_Controller_0 (
      .lcd_char  (lcd_char),
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
