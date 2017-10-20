module square_wave_osc_tb ();
   reg         CLOCK_50;
   reg         reset;
   wire [31:0] out;
   
   square_wave_osc uut (
      .CLOCK_50   (CLOCK_50),
      .reset      (reset),
      .out        (out)
   );
   
   always #5 CLOCK_50 = ~CLOCK_50;
   
   initial begin
      reset = 1;  CLOCK_50 = 0;
      #10 reset = 0;
      #2000000 $stop;
   end

endmodule
