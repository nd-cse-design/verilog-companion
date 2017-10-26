module datapath_DE2 (
   input             CLOCK_50,
   input    [0:0]    KEY,
   input    [17:0]   SW,
   output   [6:0]    HEX0,
   output   [6:0]    HEX1,
   output   [17:0]   LEDR,
   output   [7:0]    LEDG
   );
   
   wire [3:0] x;
   wire [3:0] y;
   
   assign LEDR[8:0]  = SW[8:0];
   assign LEDR[17:9] = 9'h0;
   assign LEDG[7:1]  = 6'h0;
   
   debounce debounce (
      .CLOCK_50   (CLOCK_50),
      .in         (~KEY[0]),
      .out        (clk)
   );
   
   datapath datapath (
      .clk        (clk),
      .imm        (SW[3:0]),
      .op_sel     (SW[5:4]),
      .en_x       (SW[6]),
      .en_y       (SW[7]),
      .y_sel      (SW[8]),
      .x          (x),
      .y          (y),
      .zero       (LEDG[0])
   );
   
   hexdigit h1 (
      .in      (x),
      .out     (HEX1)
   );
   
   hexdigit h0 (
      .in      (y),
      .out     (HEX0)
   );
   
endmodule
