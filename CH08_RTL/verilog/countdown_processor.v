module countdown_processor (
   input          clk,
   input          reset,
   input    [3:0] imm,
   output   [3:0] x,
   output   [3:0] y
   );

   wire    [1:0] op_sel;
   wire          en_x;
   wire          en_y;
   wire          y_sel;
   wire          zero;
   
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
      .y_sel      (y_sel)
   );
   
endmodule
