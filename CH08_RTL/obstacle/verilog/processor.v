module processor (
   input             clk,
   input             reset,
   output	[7:0]		x,
   output	[6:0]		y,
   output	[2:0]		plot_color,
   output            plot,
   input    [2:0]    image_color
   );
   
   wire        en_xpos;
   wire [1:0]  s_xpos;
   wire        en_ypos;
   wire [1:0]  s_ypos;
   wire        en_xdir;
   wire        s_xdir;
   wire        en_ydir;
   wire        s_ydir;
   wire        en_timer;
   wire        s_timer;
   wire        s_image_color;
   wire [1:0]  s_x;
   wire [1:0]  s_y;
   wire        xdir;
   wire        ydir;
   wire        timer_done;
   wire        obstacle;

   controller controller (
      .clk           (clk          ),
      .reset         (reset        ),
      .en_xpos       (en_xpos      ),
      .s_xpos        (s_xpos       ),
      .en_ypos       (en_ypos      ),
      .s_ypos        (s_ypos       ),
      .en_xdir       (en_xdir      ),
      .s_xdir        (s_xdir       ),
      .en_ydir       (en_ydir      ),
      .s_ydir        (s_ydir       ),
      .en_timer      (en_timer     ),
      .s_timer       (s_timer      ),
      .s_image_color (s_image_color),
      .s_x           (s_x          ),
      .s_y           (s_y          ),
      .plot          (plot         ),
      .xdir          (xdir         ),
      .ydir          (ydir         ),
      .timer_done    (timer_done   ),
      .obstacle      (obstacle     )
   );
   
   datapath datapath (
      .clk           (clk          ),
      .en_xpos       (en_xpos      ),
      .s_xpos        (s_xpos       ),
      .en_ypos       (en_ypos      ),
      .s_ypos        (s_ypos       ),
      .en_xdir       (en_xdir      ),
      .s_xdir        (s_xdir       ),
      .en_ydir       (en_ydir      ),
      .s_ydir        (s_ydir       ),
      .en_timer      (en_timer     ),
      .s_timer       (s_timer      ),
      .s_image_color (s_image_color),
      .s_x           (s_x          ),
      .s_y           (s_y          ),
      .xdir          (xdir         ),
      .ydir          (ydir         ),
      .timer_done    (timer_done   ),
      .obstacle      (obstacle     ),
      .x             (x            ),
      .y             (y            ),
      .plot_color    (plot_color   ),
      .image_color   (image_color  ),
      .plot          (plot         )
   );
   
endmodule
