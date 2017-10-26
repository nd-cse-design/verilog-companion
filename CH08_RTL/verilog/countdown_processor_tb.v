`timescale 1ns/1ns
module countdown_processor_tb ();
   reg          clk;
   reg          reset;
   reg    [3:0] imm;
   wire   [3:0] x;
   wire   [3:0] y;
   
   countdown_processor uut (
      .clk     (clk),
      .reset   (reset),
      .imm     (imm),
      .x       (x),
      .y       (y)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;
      #10 imm = 2; reset = 0; // S0
      #10 imm = 0;            // S1
      #10 imm = -1;           // S2
      #10 imm = 0;            // S3
      #30 $stop;              // run 3 more iterations of S3 before stopping
   end

endmodule
