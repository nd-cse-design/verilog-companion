module concat_tb ();
   reg         a;
   reg  [1:0]  b;
   wire [2:0]  y;
   
   concat uut (
      .a (a),
      .b (b),
      .y (y)
   );
   
   initial begin
          a = 1'b0;  b = 2'b00;
      #10 a = 1'b1;  b = 2'b00;
      #10 a = 1'b1;  b = 2'b10;
      #10;
   end
   
endmodule
