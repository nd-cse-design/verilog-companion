`timescale 1ns/1ns

module system_io_tb ();
   reg          clk;
   reg          reset;
   reg   [3:0]  io_in;
   wire  [15:0] proc_din;
   wire  [15:0] addr;
   wire  [15:0] proc_dout;
   wire         we;
   wire  [3:0]  io_out;
   
   parameter EX_QUIT = 5'd18;
   
   system_io uut (
      .clk        (clk),
      .reset      (reset),
      .proc_din   (proc_din),
      .addr       (addr),
      .proc_dout  (proc_dout),
      .we         (we),
      .io_in      (io_in),
      .io_out     (io_out)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  reset = 1;  io_in = 4'hb;
      #10 reset = 0;
      while (uut.processor.controller.state != EX_QUIT)
         #10;
      #10 $stop;
   end

endmodule
