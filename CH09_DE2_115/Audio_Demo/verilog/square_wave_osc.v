module square_wave_osc (
   input             CLOCK_50,
   output reg [31:0] out);
   
   initial out = 0;
   
   parameter HALF_PERIOD   	= 20'd56_818;     // for 440 Hz (50,000,000/440)/2
   // parameter HALF_PERIOD   	= 20'd5;       // for simulation
   parameter AMPLITUDE 	      = 32'd10_000_000;
   reg [19:0] count = 0;
   
   always @(posedge CLOCK_50)
      if (count == HALF_PERIOD)
         count <= 0;
      else
         count <= count + 1;

   always @(posedge CLOCK_50)
      if (count == HALF_PERIOD)
         if (out == 0)
            out <= AMPLITUDE;
         else
            out <= 0;

endmodule
