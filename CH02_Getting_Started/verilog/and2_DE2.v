module and2_DE2 (
   input    [1:0] SW,
   output   [0:0] LEDR
   );
   
   assign LEDR[0] = SW[0] & SW[1];
   
endmodule
