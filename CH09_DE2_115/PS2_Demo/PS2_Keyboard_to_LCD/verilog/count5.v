module count5 (
   input clk,
   input reset,
   input en,
   output reg [4:0] q);
   
   always @(posedge clk)
      if (reset)
         q <= 0;
      else if (en)
         q <= q + 1;
         
endmodule
