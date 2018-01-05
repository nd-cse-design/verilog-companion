`timescale 1ns/1ns
module three_inverters_tb ();
   reg a;
   wire y;
   
   three_inverters uut (
      .a (a),
      .y (y)
   );
   
   initial begin
      a = 0;
      #10 a = 1;
      #10;
   end
   
endmodule
