module mux4_assign (
   input    d0,
   input    d1,
   input    d2,
   input    d3,
   input    s0,
   input    s1,
   output   y
   );
   
   assign y = d0 & ~s1 & ~s0 | d1 & ~s1 & s0 | d2 & s1 & ~s0 | d3 & s1 & s0;
   
endmodule
