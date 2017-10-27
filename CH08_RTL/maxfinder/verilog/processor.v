module processor (
   input          clk,
   input          reset,
   input    [3:0] din,
   output   [3:0] addr,
   output   [3:0] max
   );
   
   wire  en_mar;
   wire  en_mdr;
   wire  en_max;
   wire  sel_mar;
   wire  sel_max;
   wire  mdr_gt_max;
   wire  mar_eq_maxaddr;
   
   controller controller (
      .clk              (clk),
      .reset            (reset),
      .en_mar           (en_mar),
      .en_mdr           (en_mdr),
      .en_max           (en_max),
      .sel_mar          (sel_mar),
      .sel_max          (sel_max),
      .mdr_gt_max       (mdr_gt_max),
      .mar_eq_maxaddr   (mar_eq_maxaddr)
   );
   
   datapath datapath (
      .clk              (clk),
      .reset            (reset),
      .en_mar           (en_mar),
      .en_mdr           (en_mdr),
      .en_max           (en_max),
      .sel_mar          (sel_mar),
      .sel_max          (sel_max),
      .din              (din),
      .mar              (addr),
      .max              (max),
      .mdr_gt_max       (mdr_gt_max),
      .mar_eq_maxaddr   (mar_eq_maxaddr)
   );
   
endmodule
