module timer5_tb();
   reg clk;
   reg rst;
   wire t;
   
   timer5 uut (clk, rst, t);
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  rst = 1;
      #10 rst = 0;
      #150 $stop;
   end
endmodule
