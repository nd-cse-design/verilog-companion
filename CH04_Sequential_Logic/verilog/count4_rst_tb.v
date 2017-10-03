module count4_rst_tb();
   reg clk;
   reg rst;
   wire [3:0] q;
   
   count4_rst uut (clk, rst, q);
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  rst = 1;
      #10 rst = 0;
      #50 rst = 1;
      #10 $stop;
   end
   
endmodule
