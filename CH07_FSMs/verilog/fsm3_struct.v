module fsm3_struct (
   input    clk,
   input    reset,
   input    a,
   output   x,
   output   y);
   
   wire [1:0] n;
   wire [1:0] s;
   
   reg2 state_reg (
      .clk     (clk),
      .reset   (reset),
      .d       (n),
      .q       (s)
   );
   
   fsm3_comb_logic comb_logic (
      .a       (a),
      .s       (s),
      .n       (n),
      .x       (x),
      .y       (y)
   );
   
endmodule
