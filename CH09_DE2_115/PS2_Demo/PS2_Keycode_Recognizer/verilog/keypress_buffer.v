module keypress_buffer (
   input       clk,
   input       en,
   input       clear,
   output reg  q);
   
   initial q = 0;
   
   always @(posedge clk)
      if (clear)
         q <= 0;
      else if (en)
         q <= 1;
         
endmodule
