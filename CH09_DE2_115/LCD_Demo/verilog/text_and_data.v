module text_and_data (
   input       [7:0] n,
   input       [4:0] lcd_index,
   output reg  [7:0] lcd_char
   );
   
   always @(*)
      case (lcd_index)
         0:  lcd_char = "H";
         1:  lcd_char = "E";
         2:  lcd_char = "X";
         3:  lcd_char = ":";
         4:  lcd_char = " ";
         5:  lcd_char = {4'b0, n[7:4]};
         6:  lcd_char = {4'b0, n[3:0]};
         
         16: lcd_char = "c";
         17: lcd_char = "h";
         18: lcd_char = "a";
         19: lcd_char = "r";
         20: lcd_char = ":";
         21: lcd_char = " ";
         22: lcd_char = n;     
         default: lcd_char = " ";
      endcase        
endmodule
