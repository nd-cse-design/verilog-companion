module timer5 (
   input clk,
   input rst,
   output t);
   
   reg [2:0] q;
   
   assign t = (q == 5);
   
   always @(posedge clk) begin
      if (rst | t)
         q <= 0;
      else
         q <= q + 1;
   end
   
endmodule
