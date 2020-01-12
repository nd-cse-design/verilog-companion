module ram32k (
   input                clk,
   input       [14:0]   addr,
   input       [15:0]   din,
   input                we,
   output reg  [15:0]   dout
   );
     
   reg [15:0] M [0:15'h7fff];
   initial $readmemh("io_test.mem", M);

   always @(posedge clk)
      if (we)
         M[addr] <= din;
         
   always @(posedge clk)
      dout <= M[addr];
      
endmodule

