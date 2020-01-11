module count4_rst_en (
   input clk,
   input rst,
   input en,
   output reg [3:0] q);
   
   initial q = 0;
   
   always @(posedge clk)
      if (rst)
         q <= 0;
      else if (en)
         q <= q + 1;
      
 endmodule
 