module count4 (
   input clk,
   output reg [3:0] q
   );
   
   initial q = 0;
   
   always @(posedge clk)
      q <= q + 1;
      
endmodule
