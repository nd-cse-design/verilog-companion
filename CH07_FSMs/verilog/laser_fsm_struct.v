module laser_fsm_struct (
   input    clk,
   input    reset,
   input    b,
   output   x);
   
   wire [1:0] n;
   wire [1:0] s;
   
   reg2 state_reg (
      .clk     (clk),
      .reset   (reset),
      .d       (n),
      .q       (s)
   );
   
   laser_comb_logic comb_logic (
      .b       (b),
      .s       (s),
      .n       (n),
      .x       (x)
   );
   
endmodule
