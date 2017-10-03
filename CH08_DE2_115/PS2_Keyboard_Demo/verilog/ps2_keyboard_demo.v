module ps2_keyboard_demo (
   input             CLOCK_50,
   inout             PS2_CLK,
   inout             PS2_DAT,
   output   [6:0]    HEX0,
   output   [6:0]    HEX1,
   output   [6:0]    HEX2,
   output   [6:0]    HEX3);
   
   wire [21:0] q;
   
   // 21 20 | 19 18 17 16 15 14 13 12 | 11     10 9 : 8 7 6 5 4 3 2 1 | 0
   
   shiftreg22 shiftreg22_0 (PS2_CLK, PS2_DAT, q);
   hexdigit hexdigit_3 (q[19:16], HEX3);
   hexdigit hexdigit_2 (q[15:12], HEX2);
   hexdigit hexdigit_1 (q[8:5], HEX1);
   hexdigit hexdigit_0 (q[4:1], HEX0);
   
 endmodule
 