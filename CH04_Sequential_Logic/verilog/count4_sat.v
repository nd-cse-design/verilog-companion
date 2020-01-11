module count4_sat (
   input clk,
   input [3:0] d,
   input ld,
   input en,
   output reg [3:0] q);
   
   initial q = 0;
   
   always @(posedge clk)
      if (ld)
         q <= d;
      else if (en && q != 0)
         q <= q - 1;
      
 endmodule
 