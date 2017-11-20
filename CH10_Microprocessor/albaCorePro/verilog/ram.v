module ram (
   input clk,
   input [15:0] addr,
   input [15:0] din,
   input we,
   output reg [15:0] dout
   );
     
   reg [15:0] M [0:65535];
   
   initial begin
   // Array Manipulation
      M[0]  = 16'h7220;    // ldi r2, 32 
      M[1]  = 16'h8002;    // ld r0, r2, 0 
      M[2]  = 16'h8112;    // ld r1, r2, 1 
      M[3]  = 16'h0001;    // add r0, r0, r1 
      M[4]  = 16'h9202;    // st r0, r2, 2
      M[5]  = 16'hF000;    // quit

      M[32] = 16'h3;
      M[33] = 16'h4;
      M[34] = 16'h0;
   end     
   
   always @(posedge clk)
      if (we)
         M[addr] <= din;
         
   always @(posedge clk)
      dout <= M[addr];
      
endmodule

