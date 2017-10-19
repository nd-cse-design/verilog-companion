module reg2 (
   input             clk,
   input             reset,
   input [1:0]       d,
   output reg [1:0]  q);
   
   always @(posedge clk)
      if (reset)
         q <= 2'h0;
      else
         q <= d;
         
endmodule
