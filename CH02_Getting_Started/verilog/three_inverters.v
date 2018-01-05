module three_inverters (
   input a,
   output y
   );
   
   wire n0, n1;
   
   assign n0 = ~a;
   assign n1 = ~n0;
   assign y  = ~n1;
   
endmodule
