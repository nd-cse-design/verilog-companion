module controller (
	input 				   clk,
	input 				   reset,
   output reg           en_xpos,
   output reg    [1:0]  s_xpos,
   output reg           en_ypos,
   output reg    [1:0]  s_ypos,
   output reg           en_xdir,
   output reg           s_xdir,
   output reg           en_ydir,
   output reg           s_ydir,
   output reg           en_timer,
   output reg           s_timer,
   output reg           s_color,
   output reg    [1:0]  s_obs_xy,
   output reg           plot,
   input                xdir,
   input                ydir,
   input                timer_done,
   input                obstacle
	);
   
   parameter UP                = 2'd0;
   parameter DOWN              = 2'd1;
   parameter LEFT              = 2'd2;
   parameter RIGHT             = 2'd3;
   
   parameter INIT              = 4'd0;
   parameter WAIT_TIMER        = 4'd1;
   parameter ERASE             = 4'd2;
   parameter LOOK_LEFT         = 4'd3;
   parameter LOOK_RIGHT        = 4'd4;
   parameter TEST_X_OBSTACLE   = 4'd5;
   parameter CHANGE_XDIR       = 4'd6;
   parameter LOOK_UP           = 4'd7;
   parameter LOOK_DOWN         = 4'd8;
   parameter TEST_Y_OBSTACLE   = 4'd9;
   parameter CHANGE_YDIR       = 4'd10;
   parameter DECREMENT_XPOS    = 4'd11;
   parameter INCREMENT_XPOS    = 4'd12;
   parameter DECREMENT_YPOS    = 4'd13;
   parameter INCREMENT_YPOS    = 4'd14;
   parameter DRAW              = 4'd15;
   
   reg [3:0] state, next_state;
   
   always @(posedge clk)
      if (reset)
         state <= INIT;
      else
         state <= next_state;
         
   always @(*) begin
      en_xpos  = 0;
      s_xpos   = 0;  
      en_ypos  = 0;
      s_ypos   = 0;
      en_xdir  = 0;  
      s_xdir   = 0;
      en_ydir  = 0;
      s_ydir   = 0;  
      en_timer = 0;  
      s_timer  = 0; 
      s_color  = 0;
      s_obs_xy = 0;
      plot     = 0;
      next_state = INIT;
      case (state)
         INIT              : begin
            s_xdir = 0;  en_xdir = 1;
            s_ydir = 0;  en_ydir = 1;
            s_xpos = 0;  en_xpos = 1;
            s_ypos = 0;  en_ypos = 1;
            s_timer = 0; en_timer = 1;
            next_state = WAIT_TIMER;
         end
         WAIT_TIMER        : begin
            s_color = 1;
            plot = 1;
            s_timer = 1; en_timer = 1;
            if (timer_done)   next_state = ERASE;
            else              next_state = WAIT_TIMER;
         end
         ERASE             : begin
            plot = 1;    s_color = 0;
            s_timer = 0; en_timer = 1;
            if (xdir)         next_state = LOOK_RIGHT;
            else              next_state = LOOK_LEFT;
         end
         LOOK_LEFT         : begin
            s_obs_xy = LEFT;
            next_state = TEST_X_OBSTACLE;
         end
         LOOK_RIGHT        : begin
            s_obs_xy = RIGHT;
            next_state = TEST_X_OBSTACLE;
         end
         TEST_X_OBSTACLE   : begin
            if (obstacle)     next_state = CHANGE_XDIR;
            else if (ydir)    next_state = LOOK_DOWN;
            else              next_state = LOOK_UP;
         end
         CHANGE_XDIR       : begin
            s_xdir = 1; en_xdir = 1;
            if (ydir)         next_state = LOOK_DOWN;
            else              next_state = LOOK_UP;
         end
         LOOK_UP           : begin
            s_obs_xy = UP;
            next_state = TEST_Y_OBSTACLE;
         end
         LOOK_DOWN         : begin
            s_obs_xy = DOWN;
            next_state = TEST_Y_OBSTACLE;
         end
         TEST_Y_OBSTACLE   : begin
            if (obstacle)     next_state = CHANGE_YDIR;
            else if (xdir)    next_state = INCREMENT_XPOS;
            else              next_state = DECREMENT_XPOS;
         end
         CHANGE_YDIR       : begin
            s_ydir = 1; en_ydir = 1;
            if (xdir)         next_state = INCREMENT_XPOS;
            else              next_state = DECREMENT_XPOS;      
         end
         DECREMENT_XPOS    : begin
            s_xpos = 1; en_xpos = 1;
            if (ydir)         next_state = INCREMENT_YPOS;
            else              next_state = DECREMENT_YPOS;
         end
         INCREMENT_XPOS    : begin
            s_xpos = 2; en_xpos = 1;
            if (ydir)         next_state = INCREMENT_YPOS;
            else              next_state = DECREMENT_YPOS;
         end
         DECREMENT_YPOS    : begin
            s_ypos = 1; en_ypos = 1;
            next_state = DRAW;
         end
         INCREMENT_YPOS    : begin
            s_ypos = 2; en_ypos = 1;
            next_state = DRAW;
         end
         DRAW              : begin
            s_color = 1; plot = 1;
            next_state = WAIT_TIMER;
         end
         default           :;
      endcase
   end

   
endmodule
