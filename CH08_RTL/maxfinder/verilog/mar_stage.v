module mar_stage (
   input clk,
   input en_mar,
   input s_mar,
   output reg [3:0] mar
   );
   
   always @(posedge clk)
      if (en_mar)
         if (s_mar)
            mar <= mar + 1;
         else
            mar <= 0;

endmodule
