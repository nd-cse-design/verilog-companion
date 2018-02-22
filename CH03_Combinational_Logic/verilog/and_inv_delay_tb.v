`timescale 1ns/1ns
module and_inv_delay_tb ( );
   reg   a;
   reg   b;
   reg   y;
   wire  n;
   
   assign #2 n = a & b;
   
   always @(n)
      #1 y = ~n;
      
   initial begin
          a = 0;  b = 0;
      #10 a = 1;
      #10 b = 1;
      #10 a = 0;
      #10;
   end

endmodule
