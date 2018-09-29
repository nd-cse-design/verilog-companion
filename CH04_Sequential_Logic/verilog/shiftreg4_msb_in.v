module shiftreg4_msb_in (
   input clk,
   input in,
   output reg [3:0] q
   );
   
   initial q = 0;
   
   always @(posedge clk)
      q <= {in, q[3:1]};
      
endmodule
