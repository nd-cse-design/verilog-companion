module count4_tb();
   reg clk;
   wire [3:0] q;
   
   count4 uut (
      .clk  (clk),
      .q    (q)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;
      #200 $stop;
   end
   
endmodule
