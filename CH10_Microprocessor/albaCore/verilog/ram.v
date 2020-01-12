module ram (
   input clk,
   input [15:0] addr,
   input [15:0] din,
   input we,
   output reg [15:0] dout
   );
        
   reg [15:0] M [0:65535];
   initial $readmemh("array.mem", M);
   
   always @(posedge clk)
      if (we)
         M[addr] <= din;
         
   always @(posedge clk)
      dout <= M[addr];
      
endmodule

