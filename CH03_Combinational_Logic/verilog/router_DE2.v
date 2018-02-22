module router_DE2 (
   input    [7:0]    SW,
   output   [7:0]    LEDR,
   output   [3:0]    LEDG,
   output   [6:0]    HEX0,
   output   [6:0]    HEX1
   );
   
   assign LEDR[7:0] = SW[7:0];
   
   router n (
      .sender     (SW[7:6]),
      .in0        (SW[0]),
      .in1        (SW[1]),
      .in2        (SW[2]),
      .in3        (SW[3]),
      .receiver   (SW[5:4]),
      .out0       (LEDG[0]),
      .out1       (LEDG[1]),
      .out2       (LEDG[2]),
      .out3       (LEDG[3])
   );
   
   hexdigit h1 (
      .in         ({2'h0, SW[7:6]}),
      .out        (HEX1)
   );
   
   hexdigit h0 (
      .in         ({2'h0, SW[5:4]}),
      .out        (HEX0)
   );
   
endmodule
