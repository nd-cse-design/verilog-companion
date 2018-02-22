module overflow (
   input  [3:0] a,
   input  [3:0] b,
   output [3:0] y,
   output       ov
   );
   
   assign y    = a + b;
   assign ov   = (a[3] == b[3]) & (a[3] != y[3]);
   
endmodule
   