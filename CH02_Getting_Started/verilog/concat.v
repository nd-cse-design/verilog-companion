module concat (
   input          a,
   input    [1:0] b,
   output   [2:0] y
   );
   
   assign y = {a, b};
   
endmodule
