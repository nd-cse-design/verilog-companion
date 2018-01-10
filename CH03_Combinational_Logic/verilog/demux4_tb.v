module demux4_tb ();
   reg        d;
   reg  [1:0] s;
   wire       y0;
   wire       y1;
   wire       y2;
   wire       y3;
   
   demux4 uut (
      .d    (d),
      .s    (s),
      .y0   (y0),
      .y1   (y1),
      .y2   (y2),
      .y3   (y3)
   );
   
   initial begin
          s = 0;  d = 1;
      #10 s = 1;
      #10 s = 2;
      #10 s = 3;
      #10 s = 0;  d = 0;
      #10 s = 1;
      #10 s = 2;
      #10 s = 3;
      #10;
   end
   
endmodule
