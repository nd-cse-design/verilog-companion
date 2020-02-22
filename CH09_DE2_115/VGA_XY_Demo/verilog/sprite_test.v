module sprite_test (
   input            VGA_CLK,
   input      [7:0] x,
   input      [6:0] y,
   input      [7:0] xvga,
   input      [6:0] yvga,
   output reg [2:0] color
   );
   
   wire [2:0] sprite_color, background_color;
   wire [7:0] xs = xvga - x;
   wire [6:0] ys = yvga - y;
   
   always @(*) begin
      if ((xvga >= x) && (xvga < (x + 4)) && (yvga >= y) && (yvga < (y + 4)))
         color = sprite_color;
      else
         color = background_color;
   end
   
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
      
endmodule
