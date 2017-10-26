module countdown_processor_DE2 (
   input             CLOCK_50,
   input    [1:0]    KEY,
   input    [3:0]    SW,
   output   [6:0]    HEX0,
   output   [6:0]    HEX1,
   output   [6:0]    HEX2,
   output   [17:0]   LEDR,
   output   [7:0]    LEDG
   );
   
   wire          clk;
   wire          reset;
   wire    [3:0] imm;
   wire    [1:0] op_sel;
   wire          en_x;
   wire          en_y;
   wire          y_sel;
   wire          zero;
   wire    [3:0] x;
   wire    [3:0] y;
   wire    [1:0] state_disp;
   
   assign reset      = ~KEY[1];
   assign imm        = SW[3:0];
   
   assign LEDR[17:4] = 14'h0;
   assign LEDR[3:0]  = imm;
   assign LEDG[7:6]  = op_sel;
   assign LEDG[5]    = en_x;
   assign LEDG[4]    = en_y;
   assign LEDG[3]    = y_sel;
   assign LEDG[0]    = zero;
   
   datapath datapath (
      .clk        (clk),
      .imm        (imm),
      .op_sel     (op_sel),
      .en_x       (en_x),
      .en_y       (en_y),
      .y_sel      (y_sel),
      .x          (x),
      .y          (y),
      .zero       (zero)
   );
   
   countdown_fsm controller (
      .clk        (clk),
      .reset      (reset),
      .zero       (zero),
      .op_sel     (op_sel),
      .en_x       (en_x),
      .en_y       (en_y),
      .y_sel      (y_sel),
      .state_disp (state_disp)
   );
   
   debounce debounce (
      .CLOCK_50   (CLOCK_50),
      .in         (~KEY[0]),
      .out        (clk)
   );
   
   hexdigit h2 (
      .in      ({2'b00, state_disp}),
      .out     (HEX2)
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
