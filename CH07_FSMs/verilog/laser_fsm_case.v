module laser_fsm_case (
   input       clk,
   input       reset,
   input       b,
   output reg  x);
   
   parameter S0 = 2'h0;
   parameter S1 = 2'h1;
   parameter S2 = 2'h2;
   parameter S3 = 2'h3;
   
   reg [1:0] state, next_state;
   
   always @(posedge clk)
      if (reset)
         state <= S0;
      else
         state <= next_state;
         
   always @(*) begin
      x = 0;
      case (state)
         S0: begin
            if (b)
               next_state = S1;
            else
               next_state = S0;
         end
         S1: begin
            x = 1;
            next_state = S2;
         end
         S2: begin
            x = 1;
            next_state = S3;
         end
         S3: begin
            x = 1;
            next_state = S0;
         end
      endcase
   end
   
endmodule
