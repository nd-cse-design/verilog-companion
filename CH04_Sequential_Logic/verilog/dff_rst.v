module dff_rst (
   input clk,
   input d,
   input rst,
   output reg q); 
   
   always @(posedge clk) begin
      if (rst)
         q <= 0;
       else
         q <= d;
   end
   
endmodule
