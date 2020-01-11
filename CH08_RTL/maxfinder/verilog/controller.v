module controller (
   input       clk,
   input       reset,
   output reg  en_addr,
   output reg  en_max,
   output reg  s_addr,
   output reg  s_max,
   input       din_gt_max,
   input       addr_eq_last
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
         state <= INIT;
      else
         state <= next_state;
   
   always @(*) begin
      en_addr = 0;
      en_max = 0;
      s_addr = 0;
      s_max = 0;
      next_state = INIT;
      case (state)
         INIT: begin
            en_addr = 1;
            en_max = 1;
            next_state = READ_MEM;
         end
         READ_MEM:         begin
            next_state = CHECK_MAX;
         end
         CHECK_MAX:        begin
            if (din_gt_max)
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
            en_addr = 1;
            s_addr = 1;
            if (addr_eq_last)
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
