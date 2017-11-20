module system_io (
   input          clk,
   input          reset,
   output  [15:0] proc_din,
   output  [15:0] addr,
   output  [15:0] proc_dout,
   output         we,
   input  [3:0]   io_in,
   output [3:0]   io_out
   );
      
   processor processor (
      .clk     (clk      ),
      .reset   (reset    ),
      .din     (proc_din ),
      .addr    (addr     ),
      .dout    (proc_dout),
      .we      (we       )
   );
   
   memory_map memory_io (
      .clk     (clk      ),
      .addr    (addr     ),
      .din     (proc_dout),
      .we      (we       ),
      .dout    (proc_din ),
      .io_in   (io_in    ),
      .io_out  (io_out   )
   );
   
endmodule
   