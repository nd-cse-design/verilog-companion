module laser_fsm_assign (
   input    clk,
   input    reset,
   input    b,
   output   x);
   
   wire [1:0] n;
   reg  [1:0] s;
   
   always @(posedge clk)
      if (reset)
         s <= 2'h0;
      else
         s <= n;
         
   assign n[1] = ~s[1] & s[0] | s[1] & ~s[0];
   assign n[0] = s[1] & ~s[0] | ~s[0] & b;
   assign x    = s[1] | s[0];
   
endmodule
