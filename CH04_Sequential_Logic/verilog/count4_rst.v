module count4_rst (
   input clk,
   input rst,
   output reg [3:0] q);
   
   always @(posedge clk)
      if (rst)
         q <= 0;
      else
         q <= q + 1;
      
 endmodule
 