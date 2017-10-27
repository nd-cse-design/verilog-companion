module datapath (
   input          clk,
   input    [3:0] imm,
   input    [1:0] op_sel,
   input          en_x,
   input          en_y,
   input          y_sel,
   output   [3:0] x,
   output   [3:0] y,
   output         zero
   );
   
   wire [3:0] d_y;
   wire [3:0] f;
   
   wire [3:0] op0 = x;
   wire [3:0] op1 = ~x;
   wire [3:0] op2 = x + y;
   wire [3:0] op3 = y;
   
   
   assign zero = (x == 4'h0);
   
   reg4 xreg (
      .clk  (clk),
      .en   (en_x),
      .d    (f),
      .q    (x)
   );
   
   
   reg4 yreg (
      .clk  (clk),
      .en   (en_y),
      .d    (d_y),
      .q    (y)
   );
   
   mux2x4 y_mux (
      .d0   (f),
      .d1   (imm),
      .s    (y_sel),
      .y    (d_y)
   );
   
   mux4x4 op_mux (
      .d0   (op0),
      .d1   (op1),
      .d2   (op2),
      .d3   (op3),
      .s    (op_sel),
      .y    (f)
   );
   
endmodule
