module lfsr4 (
   input clk,
   output reg [3:0] q);
   
   initial q = 4'd1;
   
   always @(posedge clk)
      q <= {q[2:0], q[3]^q[0]};
      
endmodule
