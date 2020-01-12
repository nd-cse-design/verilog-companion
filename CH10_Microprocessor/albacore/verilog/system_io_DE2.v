module system_io_DE2 (
   input CLOCK_50,
   input [0:0] KEY,
   input [3:0] SW,
   output [3:0] LEDG
   );
   
   system_io system (
      .clk        (CLOCK_50),
      .reset      (~KEY[0]),
      .io_in      (SW[3:0]),
      .io_out     (LEDG[3:0])
   );
   
endmodule
