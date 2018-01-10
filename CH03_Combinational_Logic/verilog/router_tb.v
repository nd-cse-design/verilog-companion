module router_tb ();

   reg       [1:0] sender;
   reg             in0;
   reg             in1;
   reg             in2;
   reg             in3;
   reg       [1:0] receiver;
   wire            out0;
   wire            out1;
   wire            out2;
   wire            out3;
   
   router uut (
      .sender     (sender),
      .in0        (in0),
      .in1        (in1),
      .in2        (in2),
      .in3        (in3),
      .receiver   (receiver),
      .out0       (out0),
      .out1       (out1),
      .out2       (out2),
      .out3       (out3)
   );
   
   initial begin
      in0 = 1'b1;  in1 = 1'b0;  in2 = 1'b1;  in3 = 1'b0;  sender = 2'd0;  receiver = 2'd0;
      #10 receiver = 2'd3;
      #10 sender = 2'd2;  receiver = 2'd1;
      #10;
      $stop;
   end
   
endmodule
