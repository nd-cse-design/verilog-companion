module square_wave_generator (
   input clk,
   output reg q
   );
   
   parameter HALF_PERIOD = 3'd5;
   
   initial q = 0;
   reg [3:0] count = 0;
   
   // limit check logic
   wire at_limit = (count == HALF_PERIOD);
   
   // counter process
   always @(posedge clk)
      if (at_limit)
         count <= 0;
      else 
         count <= count + 1;
   
   // toggling flip flop process
   always @(posedge clk)
      if (at_limit)
         q <= ~q;
   
endmodule
