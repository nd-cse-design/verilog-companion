module ram_64x8_readmemh (
   input            clk,
   input            wren,
   input      [7:0] din,
   input      [5:0] addr,
   output reg [7:0] dout
   );
      
   reg [7:0] M [0:63];
   initial $readmemh("memdata.mem", M);
   
   always @(posedge clk) begin
      if (wren)
         M[addr] <= din;
      dout <= M[addr];
   end
   
endmodule
