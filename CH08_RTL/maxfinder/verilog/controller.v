module controller (
   input       clk,
   input       reset,
   output reg  en_mar,
   output reg  en_mdr,
   output reg  en_max,
   output reg  s_mar,
   output reg  s_max,
   input       mdr_gt_max,
   input       mar_eq_maxaddr
   );
   
   parameter INIT             = 3'd0;
   parameter READ_MEM         = 3'd1;
   parameter CHECK_MAX        = 3'd2;
   parameter UPDATE_MAX       = 3'd3;
   parameter CHECK_LAST_ADDR  = 3'd4;
   parameter END              = 3'd5;
   
   reg [2:0] state, next_state;
   
   always @(posedge clk)
      if (reset)
         state = INIT;
      else
         state = next_state;
   
   always @(*) begin
      en_mar = 0;
      en_mdr = 0;
      en_max = 0;
      s_mar = 0;
      s_max = 0;
      next_state = INIT;
      case (state)
         INIT: begin
            en_mar = 1;
            en_max = 1;
            next_state = READ_MEM;
         end
         READ_MEM:         begin
            en_mdr = 1;
            next_state = CHECK_MAX;
         end
         CHECK_MAX:        begin
            if (mdr_gt_max)
               next_state = UPDATE_MAX;
            else
               next_state = CHECK_LAST_ADDR;
         end
         UPDATE_MAX:       begin
            en_max = 1;
            s_max = 1;
            next_state = CHECK_LAST_ADDR;
         end
         CHECK_LAST_ADDR:  begin
            en_mar = 1;
            s_mar = 1;
            if (mar_eq_maxaddr)
               next_state = END;
            else
               next_state = READ_MEM;
         end
         END:              begin
            next_state = END;
         end
         default: ;
      endcase
   end
   
endmodule
