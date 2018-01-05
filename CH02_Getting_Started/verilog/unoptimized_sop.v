module unoptimized_sop (
   input  w,
   input  x,
   input  y,
   output z
   );
   
   assign z = ~w & x & y | w & ~x & y | w & x & y;
   
endmodule
