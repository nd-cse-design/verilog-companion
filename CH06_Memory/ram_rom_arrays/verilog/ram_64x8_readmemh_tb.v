module ram_64x8_readmemh_tb ();
   reg        clk;
   reg        wren;
   reg  [7:0] din;
   reg  [5:0] addr;
   wire [7:0] dout;
   
   ram_64x8_readmemh uut (
      .clk  (clk ),
      .wren (wren),
      .din  (din ),
      .addr (addr),
      .dout (dout)
   );
   
   always #5 clk = ~clk;
   
   initial begin
          clk = 0;  din = 8'h00;  wren = 0;  addr = 0;
      #10 addr = 1;
      #10 addr = 31; 
      #10 din = 8'ha5;  wren = 1;
      #10 wren = 0;
      #10 addr = 63;
      #10 $stop;
   end

endmodule
