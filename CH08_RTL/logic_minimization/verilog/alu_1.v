module alu_1 (
   input [3:0] a, 
   input [3:0] b,
   input [3:0] c,
   input [3:0] d,
   input s,
   output [3:0] y);
   
   assign y =
      s ? c + d :
      a + b;
      
endmodule
   
   