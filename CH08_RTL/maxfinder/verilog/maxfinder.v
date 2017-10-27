module maxfinder (
   input          clk,
   input          reset,
   output   [3:0] max
   );
   
   wire     [3:0] memdata;
   wire     [3:0] addr;
   
   processor processor (
      .clk     (clk),
      .reset   (reset),
      .din     (memdata),
      .addr    (addr),
      .max     (max)
   );
   
   rom rom (
      .addr    (addr),
      .dout    (memdata)
   );
   
endmodule
