module overflow_tb ();
   reg   [3:0] a;
   reg   [3:0] b;
   wire  [3:0] y;
   wire        ov;
   
   overflow uut (
      .a    (a),
      .b    (b),
      .y    (y),
      .ov   (ov)
   );
   
   initial begin
          a = 4'b0000;  b = 4'b0000;
      #10 a = 4'b0111;  b = 4'b0001;
      #10 a = 4'b1111;  b = 4'b0010;
      #10 a = 4'b1111;  b = 4'b1000;
      #10;
   end
   
endmodule
