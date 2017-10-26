`timescale 1ns/1ns
module datapath_tb ();
   reg           clk;
   reg     [3:0] imm;
   reg     [1:0] op_sel;
   reg           en_x;
   reg           en_y;
   reg           y_sel;
   wire    [3:0] x;
   wire    [3:0] y;
   wire          zero;
   
   datapath uut (
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
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;
      #10 imm = 5;  y_sel = 1;  op_sel = 0;  en_x = 0;  en_y = 1;  // y <= 5
      #10 imm = 0;  y_sel = 0;  op_sel = 3;  en_x = 1;  en_y = 0;  // x <= y
      #10 imm = 0;  y_sel = 0;  op_sel = 1;  en_x = 1;  en_y = 0;  // x <= ~x
      #10 imm = 1;  y_sel = 1;  op_sel = 0;  en_x = 0;  en_y = 1;  // y <= 1
      #10 imm = 0;  y_sel = 0;  op_sel = 2;  en_x = 1;  en_y = 0;  // x <= x + y
      #10 imm = 5;  y_sel = 1;  op_sel = 0;  en_x = 0;  en_y = 1;  // y <= 5
      #10 imm = 0;  y_sel = 0;  op_sel = 2;  en_x = 1;  en_y = 0;  // x <= x + y
      #10 $stop;
   end 
   
endmodule
