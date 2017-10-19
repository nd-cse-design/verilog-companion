module fsm3_comb_logic (
   input          a,
   input  [1:0]   s,
   output [1:0]   n,
   output         x,
   output         y);
   
   assign n[1] = a & ~s[1];
   assign n[0] = ~a & ~s[1] & ~s[0] | a & s[1] & ~s[0];
   assign x    = ~s[1] & s[0];
   assign y    = s[1] & ~s[0];
   
endmodule
