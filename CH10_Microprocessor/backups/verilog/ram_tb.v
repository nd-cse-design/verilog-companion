`timescale 1ns/1ns
module ram_tb ();
   reg           clk;
   reg   [15:0]  raddr;
   reg   [15:0]  waddr;
   reg   [15:0]  din;
   reg           we;
   wire  [15:0]  dout;
   
   ram uut (
      .clk     (clk),
      .raddr   (raddr),
      .waddr   (waddr),
      .din     (din),
      .we      (we),
      .dout    (dout)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  din = 16'hff00; we = 1;  waddr = 0;
      #10 din = 16'hff01;  waddr = 1;  raddr = 0;
      #10 din = 16'hff02;  waddr = 2;  raddr = 1;
      #10 din = 16'hff03;  waddr = 3;  raddr = 2;
      #10 din = 16'hff04;  waddr = 4;  raddr = 3;
      #10 $stop;
   end

endmodule
