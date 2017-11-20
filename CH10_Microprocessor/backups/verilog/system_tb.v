`timescale 1ns/1ns

module system_tb ();
   reg          clk;
   reg          reset;
   wire  [15:0] proc_din;
   wire  [15:0] addr;
   wire  [15:0] proc_dout;
   wire         we;
   
   parameter EX_QUIT = 5'd18;
   
   system uut (
      .clk        (clk),
      .reset      (reset),
      .proc_din   (proc_din),
      .addr       (addr),
      .proc_dout  (proc_dout),
      .we         (we)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;
      #10 reset = 0;
      while (uut.processor.controller.state != EX_QUIT)
         #10;
      #10 $stop;
   end

endmodule
