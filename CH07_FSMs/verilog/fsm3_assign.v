module fsm3_assign (
   input       clk,
   input       reset,
   input       a,
   output      x,
   output      y);
   
   
   reg  [1:0] s;
   wire [1:0] n;
   
   always @(posedge clk)
      if (reset)
         s <= 2'h0;
      else
         s <= n;
   
   assign n[1] = a & ~s[1];
   assign n[0] = ~a & ~s[1] & ~s[0] | a & s[1] & ~s[0];
   assign x    = ~s[1] & s[0];
   assign y    = s[1] & ~s[0];
         
   
endmodule
