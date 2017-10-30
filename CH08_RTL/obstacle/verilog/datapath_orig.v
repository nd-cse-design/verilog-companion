module datapath_orig (
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
   output            xdir,
   output            ydir,
   output            timer_done,
   output            obstacle,
	output	[7:0]		xpos,
	output	[6:0]		ypos,
	output	[2:0]		color
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
   wire  [7:0]    d_xpos;
   wire  [6:0]    d_ypos;
   wire           d_xdir;
   wire           d_ydir;
   wire  [25:0]   timer;
   wire  [25:0]   d_timer;
   wire	[7:0]		xobs;
	wire	[6:0]		yobs;
   wire  [2:0]    dout_obs;

 
/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
 
/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
   assign d_xdir = s_xdir ? ~xdir : 1;
   
   assign d_ydir = s_ydir ? ~ydir : 1;
   
   assign d_xpos =
      s_xpos == 0 ? 8'd80 :
      s_xpos == 1 ? xpos - 1 :
      s_xpos == 2 ? xpos + 1 :
      0;
      
   assign d_ypos =
      s_ypos == 0 ? 7'd60 :
      s_ypos == 1 ? ypos - 1 :
      s_ypos == 2 ? ypos + 1 :
      0;
      
   assign xobs =
      s_obs_xy == 0 ? xpos :
      s_obs_xy == 1 ? xpos :
      s_obs_xy == 2 ? xpos - 1 :
      xpos + 1;
      
   assign yobs =
      s_obs_xy == 0 ? ypos - 1 :
      s_obs_xy == 1 ? ypos + 1 :
      ypos;
      
   assign d_timer    = s_timer ? timer + 1 : 0;
   
   assign color      = s_color ? 3'b010 : 3'b000;
   
   

   assign timer_done = timer == TIMER_LIMIT;
   
   assign obstacle   = dout_obs != 3'b000;
   
 
 /*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
   register_n #(1) xdir_reg (
      .clk     (clk),
      .en      (en_xdir),
      .d       (d_xdir),
      .q       (xdir)
   );
   
   register_n #(1) ydir_reg (
      .clk     (clk),
      .en      (en_ydir),
      .d       (d_ydir),
      .q       (ydir)
   );
   
   register_n #(8) xpos_reg (
      .clk     (clk),
      .en      (en_xpos),
      .d       (d_xpos),
      .q       (xpos)
   );
   
   register_n #(7) ypos_reg (
      .clk     (clk),
      .en      (en_ypos),
      .d       (d_ypos),
      .q       (ypos)
   );
   
   register_n #(26) timer_reg (
      .clk     (clk),
      .en      (en_timer),
      .d       (d_timer),
      .q       (timer)
   );
   
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
