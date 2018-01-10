module unsigned_comparator_tb ();
   reg [3:0] x;
   reg [3:0] y;
   wire      gt;
   wire      lt;
   wire      eq;
   
   unsigned_comparator uut (
      .x    (x),
      .y    (y),
      .gt   (gt),
      .lt   (lt),
      .eq   (eq)
   );
   
   initial begin
          x = 5;  y = 7;
      #10 x = 7;  y = 5;
      #10 x = 5;  y = 5;
      #10;
   end
   
endmodule
