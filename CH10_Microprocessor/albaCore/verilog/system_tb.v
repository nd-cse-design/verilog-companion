`timescale 1ns/1ns

module system_tb ();
   reg          clk;
   reg          reset;
   
   parameter EX_QUIT = 5'd18;
   
   system uut (
      .clk        (clk),
      .reset      (reset)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;
      #10 reset = 0;
      while (uut.processor.controller.state != EX_QUIT)
         #10;
      #10 $stop;
   end

endmodule
