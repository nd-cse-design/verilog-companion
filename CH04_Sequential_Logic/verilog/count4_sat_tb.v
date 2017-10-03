`timescale 1ns/1ns

module count4_sat_tb ();

   reg clk;
   reg [3:0] d;
   reg ld;
   reg en;
   wire [3:0] q;
   
   count4_sat uut (
      .clk  (clk),
      .d    (d),
      .ld   (ld),
      .en   (en),
      .q    (q)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  ld = 1;  d = 4'd3;  en = 0;
      #10 ld = 0;
      #10 en = 1;
      #50 $stop;
   end

endmodule
