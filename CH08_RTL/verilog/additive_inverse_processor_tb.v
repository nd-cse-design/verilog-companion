`timescale 1ns/1ns
module additive_inverse_processor_tb ();
   reg          clk;
   reg          reset;
   reg    [3:0] imm;
   wire   [3:0] x;
   wire   [3:0] y;
   wire         zero;
   
   additive_inverse_processor uut (
      .clk     (clk),
      .reset   (reset),
      .imm     (imm),
      .x       (x),
      .y       (y),
      .zero    (zero)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;
      #10 imm = 5; reset = 0; // S0
      #10 imm = 0;            // S1
      #10 imm = 0;            // S2
      #10 imm = 1;            // S3
      #10 imm = 0;            // S4
      #10 imm = 5;            // S5
      #10 imm = 0;            // S6
      #10 $stop;
   end

endmodule
