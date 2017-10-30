module alu_tb ();
   reg [3:0] a, b, c, d;
   reg s;
   wire [3:0] y1, y2;
   
   alu_1 uut1 (
      .a (a), 
      .b (b),
      .c (c),
      .d (d),
      .s (s),
      .y (y1)
   );
   
   alu_2 uut2 (
      .a (a), 
      .b (b),
      .c (c),
      .d (d),
      .s (s),
      .y (y2)
   );
   
   initial begin
      a = 1; b = 2; c = 4; d = 8; s = 0;
      #10 s = 1;
      #10 $stop;
   end
   
endmodule
