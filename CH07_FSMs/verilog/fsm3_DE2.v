module fsm3_DE2 (
   input             CLOCK_50,
   input    [0:0]    SW,
   input    [1:0]    KEY,
   output   [17:0]   LEDR,
   output   [7:0]    LEDG,
   output   [6:0]    HEX0
   );
   
   parameter S0 = 2'h0;
   parameter S1 = 2'h1;
   parameter S2 = 2'h2;
   
   wire        clk;
   wire        reset;
   wire        a;
   reg         x;
   reg         y;
   reg [1:0] state, next_state;
   
   assign a          = SW[0];
   assign reset      = ~KEY[1];
   assign LEDR[0]    = a;
   assign LEDG[1]    = x;
   assign LEDG[0]    = y;
   assign LEDR[17:1] = 17'h0;
   assign LEDG[7:2]  = 6'h0;
   
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
   
   debounce clk_debounce (
      .CLOCK_50   (CLOCK_50),
      .in         (~KEY[0]),
      .out        (clk)
   );
   
   hexdigit h0 (
      .in         ({2'b00, state}),
      .out        (HEX0)
   );
   
   
endmodule
