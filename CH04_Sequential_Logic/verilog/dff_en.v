module dff_en (
   input clk,
   input d,
   input en,
   output reg q);
   
   always @(posedge clk)
      if (en)
         q <= d;
   
endmodule
