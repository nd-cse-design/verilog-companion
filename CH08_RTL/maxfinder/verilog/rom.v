module rom (
   input             clk,
   input       [3:0] addr,
   output reg  [3:0] dout
   );
   
   reg [3:0] mem [0:15];
   initial begin
      mem[0]  = 0;
      mem[1]  = 1;
      mem[2]  = 0;
      mem[3]  = 7;
      mem[4]  = 0;
      mem[5]  = 0;
      mem[6]  = 0;
      mem[7]  = 0;
      mem[8]  = 0;
      mem[9]  = 5;
      mem[10] = 0;
      mem[11] = 0;
      mem[12] = 10;
      mem[13] = 0;
      mem[14] = 0;
      mem[15] = 0;
   end
   
   always @(posedge clk)
      dout <= mem[addr];
   
endmodule
