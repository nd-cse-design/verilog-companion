module additive_inverse_processor (
   input          clk,
   input          reset,
   input    [3:0] imm,
   output   [3:0] x,
   output   [3:0] y,
   output         zero
   );

   wire    [1:0] op_sel;
   wire          en_x;
   wire          en_y;
   wire          y_sel;
   
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
   
   additive_inverse_fsm controller (
      .clk        (clk),
      .reset      (reset),
      .op_sel     (op_sel),
      .en_x       (en_x),
      .en_y       (en_y),
      .y_sel      (y_sel)
   );
   
endmodule
