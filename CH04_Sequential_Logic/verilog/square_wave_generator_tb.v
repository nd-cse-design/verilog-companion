module square_wave_generator_tb();
   reg clk;
   wire t;
   
   square_wave_generator uut (clk, q);
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;
      #300 $stop;
   end
endmodule
