module additive_inverse_fsm (
   input             clk,
   input             reset,
   output reg  [1:0] op_sel,
   output reg        en_x,
   output reg        en_y,
   output reg        y_sel
   );
   
   parameter S0   = 3'd0;
   parameter S1   = 3'd1;
   parameter S2   = 3'd2;
   parameter S3   = 3'd3;
   parameter S4   = 3'd4;
   parameter S5   = 3'd5;
   parameter S6   = 3'd6;
   
   reg [2:0] state, next_state;
      
   always @(posedge clk)
      if (reset)
         state <= S0;
      else
         state <= next_state;
   
//      0   y_sel = 1;  op_sel = 0;  en_x = 0;  en_y = 1;  // y <= 5
//      1   y_sel = 0;  op_sel = 3;  en_x = 1;  en_y = 0;  // x <= y
//      2   y_sel = 0;  op_sel = 1;  en_x = 1;  en_y = 0;  // x <= ~x
//      3   y_sel = 1;  op_sel = 0;  en_x = 0;  en_y = 1;  // y <= 1
//      4   y_sel = 0;  op_sel = 2;  en_x = 1;  en_y = 0;  // x <= x + y
//      5   y_sel = 1;  op_sel = 0;  en_x = 0;  en_y = 1;  // y <= 5
//      6   y_sel = 0;  op_sel = 2;  en_x = 1;  en_y = 0;  // x <= x + y
      
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
            op_sel = 1;  en_x = 1;
            next_state = S3;
         end
         S3: begin
            y_sel = 1;  en_y = 1;
            next_state = S4;
         end
         S4: begin
            op_sel = 2;  en_x = 1;
            next_state = S5;
         end
         S5: begin
            y_sel = 1;  en_y = 1;
            next_state = S6;
         end
         S6: begin
           op_sel = 2;  en_x = 1;
           next_state = S0;
         end
         default
            next_state = S0;
      endcase
   end
   
endmodule
