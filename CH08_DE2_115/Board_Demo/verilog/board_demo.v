module board_demo (
   input    [17:0]   SW,
   input    [3:0]    KEY,
   output   [17:0]   LEDR,
   output   [8:0]    LEDG,
   output   [6:0]    HEX0,
   output   [6:0]    HEX1
   );
   
   assign LEDR[17:0] = SW[17:0];
   assign LEDG[3:0] = KEY[3:0];
   assign HEX0[6:0] = SW[6:0];
   assign HEX1[6:0] = SW[13:7];
   
endmodule
