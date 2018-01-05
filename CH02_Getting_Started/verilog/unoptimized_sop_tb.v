`timescale 1ns/1ns
module unoptimized_sop_tb ();
   reg   w;
   reg   x;
   reg   y;
   wire  z;
   
   unoptimized_sop uut (
      .w (w),
      .x (x),
      .y (y),
      .z (z)
   );
   
   initial begin
      w = 0;  x = 0;  y = 1;
      #10 w = 1;
      #10;
   end
   
endmodule
   