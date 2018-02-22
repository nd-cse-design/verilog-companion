module and_inv (
   input       a,
   input       b,
   output reg  y
   );
   
   wire n;
   
   assign n = a & b;
   
   always @(n)
      y = ~n;

endmodule
