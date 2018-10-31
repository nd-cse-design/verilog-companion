module sprite_test_tb ();
   reg          VGA_CLK;
   reg    [7:0] x;
   reg    [6:0] y;
   reg    [7:0] xvga;
   reg    [6:0] yvga;
   wire   [2:0] pixel;

   sprite_test uut (
      .VGA_CLK (VGA_CLK),
      .x       (x      ),
      .y       (y      ),
      .xvga    (xvga   ),
      .yvga    (yvga   ),
      .pixel   (pixel  )
   );
   
   always #5 VGA_CLK = ~VGA_CLK;
   
   initial begin
      VGA_CLK = 0;  x = 4;  y = 16;  xvga = 0;  yvga = 0;
      #10 xvga = 4;  yvga = 16;
      #10 xvga = 7;  yvga = 19;
      #10 xvga = 8;  yvga = 20;
      #20 $stop;
   end

endmodule
