module fsm3_tb ();
   reg clk;
   reg reset;
   reg a;
   wire x;
   wire y;
   
   fsm3_case uut (
      .clk     (clk),
      .reset   (reset),
      .a       (a),
      .x       (x),
      .y       (y)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;  a = 0;
      #10 reset = 0; // S0
      #10;           // S1
      #10 a = 1;     // S0
      #10;           // S2
      #10;           // S0
      #10 a = 0;     // S2
      #10 $stop;     // S0
   end

endmodule
