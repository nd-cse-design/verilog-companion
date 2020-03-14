module square_wave_osc_tb ();
   reg         CLOCK_50;
   wire [31:0] out;
   
   square_wave_osc uut (
      .CLOCK_50   (CLOCK_50),
      .out        (out)
   );
   
   always #5 CLOCK_50 = ~CLOCK_50;
   
   initial begin
      CLOCK_50 = 0;
      #200 $stop;
   end

endmodule
