module datapath (
	input					clk,
   input             en_xpos,
   input    [1:0]    s_xpos,
   input             en_ypos,
   input    [1:0]    s_ypos,
   input             en_xdir,
   input             s_xdir,
   input             en_ydir,
   input             s_ydir,
   input             en_timer,
   input             s_timer,
   input             s_image_color,
   input      [1:0]  s_x,
   input      [1:0]  s_y,
   output reg        xdir,
   output reg        ydir,
   output            timer_done,
   output            obstacle,
	output     [7:0]	x,
	output     [6:0]	y,
	output     [2:0]	plot_color,
   input      [2:0]  image_color,
   input             plot
   );
   
/***************************************************************************
 *                           Parameter Declarations                        *
 ***************************************************************************/
   parameter TIMER_LIMIT = 26'd1_000_000;
//   parameter TIMER_LIMIT = 26'd2;
 
/***************************************************************************
 *                 Internal Wire and Register Declarations                 *
 ***************************************************************************/
   reg   [25:0]   timer;
   reg   [7:0]    xpos;
   reg   [6:0]    ypos;

 
/***************************************************************************
 *                             Sequential Logic                            *
 ***************************************************************************/
   always @(posedge clk)
      if (en_xdir)
         if (s_xdir)
            xdir <= ~xdir;
         else
            xdir <= 1;
            
   always @(posedge clk)
      if (en_ydir)
         if (s_ydir)
            ydir <= ~ydir;
         else
            ydir <= 1;
            
   always @(posedge clk)
      if (en_xpos)
         case (s_xpos)
            0: xpos <= 8'd80;
            1: xpos <= xpos - 1;
            2: xpos <= xpos + 1;
            default: xpos <= 0;
         endcase       
            
   always @(posedge clk)
      if (en_ypos)
         case (s_ypos)
            0: ypos <= 7'd60;
            1: ypos <= ypos - 1;
            2: ypos <= ypos + 1;
            default: ypos <= 0;
         endcase
         
   always @(posedge clk)
      if (en_timer)
         if (s_timer)
            timer <= timer + 1;
         else
            timer <= 0;
            
 
/***************************************************************************
 *                            Combinational Logic                          *
 ***************************************************************************/
   // obstacle memory coordinate addresses
   assign x =
      s_x == 0 ? xpos :
      s_x == 1 ? xpos - 1 :
      xpos + 1;
      
   assign y =
      s_y == 0 ? ypos :
      s_y == 1 ? ypos - 1 :
      ypos + 1;
 
   // pixel color to VGA adapter
   assign plot_color = s_image_color ? 3'b010 : 3'b000;
   
   // flags
   assign timer_done = timer == TIMER_LIMIT;   
   assign obstacle   = image_color != 3'b000;
    
endmodule
