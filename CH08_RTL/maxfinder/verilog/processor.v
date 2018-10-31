module processor (
   input          clk,
   input          reset,
   input    [3:0] din,
   output   [3:0] addr,
   output   [3:0] max
   );
   
   wire  en_addr;
   wire  en_max;
   wire  s_addr;
   wire  s_max;
   wire  din_gt_max;
   wire  addr_eq_last;
   
   controller controller (
      .clk              (clk),
      .reset            (reset),
      .en_addr          (en_addr),
      .en_max           (en_max),
      .s_addr           (s_addr),
      .s_max            (s_max),
      .din_gt_max       (din_gt_max),
      .addr_eq_last     (addr_eq_last)
   );
   
   datapath datapath (
      .clk              (clk),
      .en_addr          (en_addr),
      .en_max           (en_max),
      .s_addr           (s_addr),
      .s_max            (s_max),
      .din              (din),
      .addr             (addr),
      .max              (max),
      .din_gt_max       (din_gt_max),
      .addr_eq_last     (addr_eq_last)
   );
   
endmodule
