module or5_DE2 (
   input    [4:0] SW,
   output   [0:0] LEDR
   );
   
   assign LEDR[0] = SW[0] | SW[1] | SW[2] | SW[3] | SW[4];
   
endmodule
