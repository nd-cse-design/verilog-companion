module countdown_fsm (
   input             clk,
   input             reset,
   input             zero,
   output reg  [1:0] op_sel,
   output reg        en_x,
   output reg        en_y,
   output reg        y_sel,
   // bring internal state register to output port for display use only
   output      [1:0] state_disp
   );
   
   parameter S0   = 2'd0;
   parameter S1   = 2'd1;
   parameter S2   = 2'd2;
   parameter S3   = 2'd3;

   
   reg [1:0] state, next_state;
   
   assign state_disp = state;
   
   always @(posedge clk)
      if (reset)
         state <= S0;
      else
         state <= next_state;
   
      
   always @(*) begin
      op_sel   = 0;
      en_x     = 0;
      en_y     = 0;
      y_sel    = 0;
      case (state)
         S0: begin
            y_sel = 1;  en_y = 1;
            next_state = S1;
         end
         S1: begin
            op_sel = 3;  en_x = 1;
            next_state = S2;
         end
         S2: begin
            y_sel = 1;  en_y = 1;
            next_state = S3;
         end
         S3: begin
            op_sel = 2;  en_x = 1;
            if (zero)
               next_state = S0;
            else
               next_state = S3;
         end
         default
            next_state = S0;
      endcase
   end
   
endmodule
