module image_ram_1r1w (
   input            clk,
   input            wren,
   input      [2:0] din,   // 3 RGB bits per pixel
   input      [7:0] x,     // 8 bits for up to 160   
   input      [6:0] y,     // 7 bits for up to 120
   output reg [2:0] dout
   );
   
   wire [14:0] addr;       // 15 bits for up to 19199
   assign addr = 160*y + x;
      
   reg [2:0] M [0:19199];
   initial $readmemh("testpattern.mem", M);
   
   always @(posedge clk) begin
      if (wren)
         M[addr] <= din;
      dout <= M[addr];
   end
   
endmodule
