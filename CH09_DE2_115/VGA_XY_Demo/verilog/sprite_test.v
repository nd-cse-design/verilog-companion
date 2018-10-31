module sprite_test (
   input          VGA_CLK,
   input    [7:0] x,
   input    [6:0] y,
   input    [7:0] xvga,
   input    [6:0] yvga,
   output   [2:0] color
   );
   
   wire [2:0] sprite_color, background_color;
   wire [7:0] xs = xvga - x;
   wire [6:0] ys = yvga - y;
   wire in_sprite = (xvga >= x) & (xvga < (x + 4)) & (yvga >= y) & (yvga < (y + 4));
   reg  in_sprite_delayed;
   
   always @(posedge VGA_CLK)
      in_sprite_delayed <= in_sprite;
   
   sprite_rom sprite_rom ( 
      .clk  (VGA_CLK),    			
      .x    (xs[1:0]),
      .y    (ys[1:0]),  
      .dout (sprite_color)
   );
   
   background_rom background_rom ( 
      .clk  (VGA_CLK),    			
      .x    (xvga),
      .y    (yvga),  
      .dout (background_color)
   );
   
   assign color = in_sprite_delayed ? sprite_color : background_color;
   
endmodule
