`timescale 1ns/1ns

module signal_generator ();
   reg a;
   reg b;
   
   initial begin
      a = 0;  b = 0;
      #10 a = 0;  b = 1;
      #10 a = 1;  b = 0;
      #10 a = 1;  b = 1;
      #10;
   end
   
endmodule
