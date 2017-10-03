module reg8_en_rst (
   input             clk,
   input       [7:0] d,
   input             en,
   input             rst, 
   output reg  [7:0] q);
   
   always @(posedge clk)
      if (rst)
         q <= 0;
      else if (en)
         q <= d;
   
endmodule
