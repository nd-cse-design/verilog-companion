module reduction_tb ();
   reg [1:0] in;
   wire      out_and;
   wire      out_nand;
   wire      out_or;
   wire      out_nor;
   wire      out_xor;
   wire      out_xnor;
   
   reduction uut (
      .in         (in),
      .out_and    (out_and),
      .out_nand   (out_nand),
      .out_or     (out_or),
      .out_nor    (out_nor),
      .out_xor    (out_xor),
      .out_xnor   (out_xnor)
   );
   
   initial begin
          in = 2'b00;
      #10 in = 2'b01;
      #10 in = 2'b10;
      #10 in = 2'b11;
      #10;
   end

endmodule
