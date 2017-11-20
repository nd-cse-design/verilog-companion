module flags (
   input [15:0] b,
   output neg,
   output zero
   );
   
   assign neg     = b[15];
   assign zero    = b == 0;
   
endmodule
