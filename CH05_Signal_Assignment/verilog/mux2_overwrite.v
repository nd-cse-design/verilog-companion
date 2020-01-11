module mux2_overwrite (
   input       d0,
   input       d1,
   input       s,
   output reg  f);
   
   always @(*) begin
      f = d0;
      if (s)
         f = d1;
   end
   
endmodule

