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
   wire  s_mar;
   wire  s_max;
   wire  mdr_gt_max;
   wire  mar_eq_maxaddr;
   
   controller controller (
      .clk              (clk),
      .reset            (reset),
      .en_mar           (en_mar),
      .en_mdr           (en_mdr),
      .en_max           (en_max),
      .s_mar            (s_mar),
      .s_max            (s_max),
      .mdr_gt_max       (mdr_gt_max),
      .mar_eq_maxaddr   (mar_eq_maxaddr)
   );
   
   datapath datapath (
      .clk              (clk),
      .en_mar           (en_mar),
      .en_mdr           (en_mdr),
      .en_max           (en_max),
      .s_mar            (s_mar),
      .s_max            (s_max),
      .din              (din),
      .mar              (addr),
      .max              (max),
      .mdr_gt_max       (mdr_gt_max),
      .mar_eq_maxaddr   (mar_eq_maxaddr)
   );
   
endmodule
