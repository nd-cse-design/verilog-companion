module shiftreg4_tb ();
   reg clk;
   reg in;
   wire [3:0] q;
   
   shiftreg4_lsb_in uut (
      .clk  (clk),
      .in   (in),
      .q    (q)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  in = 1;
      #40 $stop;
   end
   
endmodule
