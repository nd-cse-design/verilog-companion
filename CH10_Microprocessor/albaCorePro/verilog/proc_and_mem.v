module proc_and_mem (
   input          clk
   );
   
   wire  [15:0] proc_din;
   wire  [15:0] addr;
   wire  [15:0] proc_dout;
   wire         we;
      
   processor albacore (
      .clk     (clk      ),
//    .reset   (1'b0     ),
      .din     (proc_din ),
      .addr    (addr     ),
      .dout    (proc_dout),
      .we      (we       )
   );
   
   ram memory (
      .clk     (clk      ),
      .addr    (addr     ),
      .din     (proc_dout),
      .we      (we       ),
      .dout    (proc_din )
   );
   
endmodule
   