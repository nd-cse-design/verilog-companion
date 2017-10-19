module fsm3_case (
   input       clk,
   input       reset,
   input       a,
   output reg  x,
   output reg  y);
   
   parameter S0 = 2'h0;
   parameter S1 = 2'h1;
   parameter S2 = 2'h2;
   
   reg [1:0] state, next_state;
   
   always @(posedge clk)
      if (reset)
         state <= S0;
      else
         state <= next_state;
         
   always @(*) begin
      x = 0;
      y = 0;
      case (state)
         S0: begin
            if (a)
               next_state = S2;
            else
               next_state = S1;
         end
         S1: begin
            x = 1;
            if (a)
               next_state = S2;
            else
               next_state = S0;
         end
         S2: begin
            y = 1;
            if (a)
               next_state = S1;
            else
               next_state = S0;
         end
         default: begin
            next_state = S0;
         end
      endcase
   end
   
endmodule
