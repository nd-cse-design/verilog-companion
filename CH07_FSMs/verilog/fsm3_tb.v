module fsm3_tb ();
   reg clk;
   reg reset;
   reg a;
   wire x;
   wire y;
   
   fsm3_struct uut (
      .clk     (clk),
      .reset   (reset),
      .a       (a),
      .x       (x),
      .y       (y)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;  a = 0;
      #10 reset = 0;
      #10;
      #10 a = 1;
      #10;
      #10;
      #10 a = 0;
      #10 $stop;
   end

endmodule
