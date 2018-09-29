module shiftreg4_lsb_in (
   input clk,
   input in,
   output reg [3:0] q
   );
   
   initial q = 0;
   
   always @(posedge clk)
      q <= {q[2:0], in};
      
endmodule
