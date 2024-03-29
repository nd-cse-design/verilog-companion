module system (
   input          clk,
   input          reset
   );
	
	wire  [15:0] proc_din;
   wire  [15:0] addr;
   wire  [15:0] proc_dout;
   wire         we;
      
   processor processor (
      .clk     (clk      ),
      .reset   (reset    ),
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
   