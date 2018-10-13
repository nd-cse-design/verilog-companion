module hello_rom_de2 (
	input          CLOCK_50,	
	output         LCD_ON,		
	output         LCD_BLON,	
	output         LCD_RW,		
	output         LCD_EN,		
	output         LCD_RS,		
	inout    [7:0] LCD_DATA  
   );
   
   wire [4:0] lcd_index;
   wire [7:0] lcd_char;
   
   hello_rom hello_rom_0 (
      .addr    (lcd_index),
      .dout    (lcd_char)
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
   
endmodule
