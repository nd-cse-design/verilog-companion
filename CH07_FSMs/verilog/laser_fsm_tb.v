module laser_fsm_tb ();
   reg clk;
   reg reset;
   reg b;
   wire x;
   
   laser_fsm_case uut (
      .clk     (clk),
      .reset   (reset),
      .b       (b),
      .x       (x)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;  b = 0;
      #10 reset = 0;
      #10 b = 1;
      #10 b = 0;
      #50 $stop;
   end

endmodule
