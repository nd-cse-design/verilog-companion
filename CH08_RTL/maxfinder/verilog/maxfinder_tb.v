module maxfinder_tb ();
   reg         clk;
   reg         reset;
   wire [3:0]  max;

   maxfinder uut (
      .clk     (clk),
      .reset   (reset),
      .max     (max)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;
      #10 reset = 0;
      while (uut.processor.controller.state != 3'd5)
         #10;
      #10 $stop;
   end

endmodule
