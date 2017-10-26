module mux2x4 (
   input       [3:0] d0,
   input       [3:0] d1,
   input             s,
   output reg  [3:0] y
   );
   
   always @(*)
      if (~s)
         y = d0;
      else
         y = d1;
         
endmodule
