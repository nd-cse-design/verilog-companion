module regfile (
   input             clk,
   input [15:0]      din,
   input [3:0]       waddr,
   input [3:0]       raddra,   
   input [3:0]       raddrb,
   input             we,
   output [15:0]     douta,   
   output [15:0]     doutb
   );
   
   reg [15:0] M [0:15];
   
   always @(posedge clk)
      if (we)
         M[waddr] <= din;
   
   assign douta = M[raddra];   
   assign doutb = M[raddrb];
   
endmodule
