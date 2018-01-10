`timescale 1ns/1ns
module adder4_tb ();
   reg  [3:0]  a;
   reg  [3:0]  b;
   wire [3:0]  s;
   
   adder4 uut (
      .a (a),
      .b (b),
      .s (s)
   );
   
   initial begin
          a = 4'b1111;  b = 4'b0000;
      #10 b = 4'b0001;
      #10;
   end
   
endmodule
