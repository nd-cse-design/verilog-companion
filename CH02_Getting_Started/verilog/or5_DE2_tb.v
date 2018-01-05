`timescale 1ns/1ns
module or5_DE2_tb ();
   reg   [4:0] SW;
   wire  [0:0] LEDR;
   
   or5_DE2 uut (
      .SW   (SW),
      .LEDR (LEDR)
   );
   
   initial begin
          SW = 5'b00000;
      #10 SW = 5'b00001;
      #20;
   end
   
endmodule
      