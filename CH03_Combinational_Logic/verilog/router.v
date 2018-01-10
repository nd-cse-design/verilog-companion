module router (
   input  [1:0] sender,
   input        in0,
   input        in1,
   input        in2,
   input        in3,
   input  [1:0] receiver,
   output       out0,
   output       out1,
   output       out2,
   output       out3
   );
   
   wire bus;
   
   mux4 mux4_0 (
      .d0 (in0),
      .d1 (in1),
      .d2 (in2),
      .d3 (in3),
      .s  (sender),
      .f  (bus)
   );
   
   demux4 demux4_0 (
      .d  (bus),
      .s  (receiver),
      .y0 (out0),
      .y1 (out1),
      .y2 (out2),
      .y3 (out3)
   );
   
endmodule
