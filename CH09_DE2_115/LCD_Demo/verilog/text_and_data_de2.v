module text_and_data_de2 (
   input    [7:0]    SW,     
   output   [17:0]   LEDR,
	input             CLOCK_50,
	output            LCD_ON,
	output            LCD_BLON,
	output            LCD_RW,
	output            LCD_EN,
	output            LCD_RS,
	inout    [7:0]    LCD_DATA
   );
   
   wire [4:0] lcd_index;
   wire [7:0] lcd_char;
   
   assign LEDR[17:8] = 0;
   assign LEDR[7:0]  = SW[7:0];
   
   text_and_data text_and_data_0 (
      .n          (SW[7:0]),
      .lcd_index  (lcd_index),
      .lcd_char   (lcd_char)
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
