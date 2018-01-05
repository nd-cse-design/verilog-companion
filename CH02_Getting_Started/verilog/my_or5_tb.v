`timescale 1ns/1ns
module my_or5_tb ();
   reg   a, b, c, d, e;
   wire  y;
   
   my_or5 uut (
      .a  (a),
      .b  (b),
      .c  (c),
      .d  (d),
      .e  (e),
      .y  (y)
   );
   
   initial begin
      a = 0;  b = 0;  c = 0;  d = 0;  e = 0;
      #10 a = 1;
      #10;
   end
   
endmodule
      