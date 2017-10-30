module alu_2 (
   input [3:0] a, 
   input [3:0] b,
   input [3:0] c,
   input [3:0] d,
   input s,
   output [3:0] y);
   
   wire [3:0] in1, in2;
   
   assign in1 = s ? c : a;
   assign in2 = s ? d : b;
   assign y = in1 + in2;
      
endmodule
   
   