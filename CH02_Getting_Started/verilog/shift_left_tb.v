module shift_left_tb ();
   reg   [7:0] a;
   wire  [7:0] y;
   
   shift_left uut (
      .a (a),
      .y (y)
    );
   
   initial begin
          a = 8'b00000000;
      #10 a = 8'b11110001;
      #10;
   end
   
endmodule
