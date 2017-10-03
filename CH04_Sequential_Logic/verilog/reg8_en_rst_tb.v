`timescale 1ns/1ns
module reg8_en_rst_tb ();
   reg         clk;
   reg  [7:0]  d;
   reg         en;
   reg         rst;
   wire  [7:0] q;
   
   reg8_en_rst uut (
      .clk  (clk),
      .d    (d),
      .en   (en),
      .rst  (rst),
      .q    (q)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  en = 0;  rst = 1;  d = 8'hab;
      #10 rst = 0;
      #10 en = 1;
      #10;
      $stop;
   end

endmodule
