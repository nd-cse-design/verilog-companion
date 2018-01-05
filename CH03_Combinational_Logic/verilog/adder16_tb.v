`timescale 1ns/1ns
module adder16_tb ();
   reg   [7:0] a, b;
   wire  [7:0] sum;
   
   adder16 uut (
      .a    (a),
      .b    (b),
      .sum  (sum)
   );
   
   initial begin
      a = 0;  b = 8'hff;
      #100 a = 8'h1;
      #100;
   end
   
   endmodule
