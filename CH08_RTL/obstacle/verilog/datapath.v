module datapath (
	input					clk,
	input					reset,
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
   input             s_color,
   input    [1:0]    s_obs_xy,
   output reg        xdir,
   output reg        ydir,
   output            timer_done,
   output            obstacle,
	output reg [7:0]	xpos,
	output reg [6:0]	ypos,
	output     [2:0]	color
   );
   
/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
   parameter TIMER_LIMIT = 26'd1_000_000;
   parameter UP                = 2'd0;
   parameter DOWN              = 2'd1;
   parameter LEFT              = 2'd2;
   parameter RIGHT             = 2'd3;
 
/*****************************************************************************
 *                 Internal Wire and Register Declarations                   *
 *****************************************************************************/
   reg   [25:0]   timer;
   wire	[7:0]		xobs;
	wire	[6:0]		yobs;
   wire  [2:0]    dout_obs;

 
/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
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
            
 
/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
   assign xobs =
      s_obs_xy == 0 ? xpos :
      s_obs_xy == 1 ? xpos :
      s_obs_xy == 2 ? xpos - 1 :
      xpos + 1;
      
   assign yobs =
      s_obs_xy == 0 ? ypos - 1 :
      s_obs_xy == 1 ? ypos + 1 :
      ypos;
         
   assign color      = s_color ? 3'b010 : 3'b000;
   
   

   assign timer_done = timer == TIMER_LIMIT;
   
   assign obstacle   = dout_obs != 3'b000;
   
 
 /*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
   image_ram obstacle_mem (
		.clk					(clk),
		.x_read				(xobs),
		.y_read				(yobs),
		.color_out			(dout_obs),
		.x_write				(8'd0),
		.y_write				(7'd0),
		.color_in			(3'd0),
		.wren					(1'b0)
	);
	defparam obstacle_mem.BACKGROUND_IMAGE = "obstacle_course.mif";
   
endmodule
