module character_and_location (
	input		   [4:0]	lcd_index,
	input		   [7:0]	character,
	input		   [4:0]	location,
	output reg	[7:0]	dout
	);
	
   always @(*)
      if (location == lcd_index)
         dout = character;
      else
         dout = " ";
	
endmodule
