module dff_initialized (
   input clk,
   input d,
   output reg q);
   
   initial q = 1'b1;
   
   always @(posedge clk)
      q <= d;
      
endmodule
