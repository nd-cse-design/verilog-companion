module addr_stage (
   input clk,
   input en_addr,
   input s_addr,
   output reg [3:0] addr
   );
   
   always @(posedge clk)
      if (en_addr)
         if (s_addr)
            addr <= addr + 1;
         else
            addr <= 0;

endmodule
