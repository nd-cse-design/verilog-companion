module ram (
   input clk,
   input [15:0] addr,
   input [15:0] din,
   input we,
   output reg [15:0] dout
   );
     
   reg [15:0] M [0:65535];
   
   /**
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
   **/
   
   /**
   initial begin
   // Function Call
      M[0]   = 16'h7320;   // ldi r3, 32
      M[1]   = 16'h8103;   // ld r1, r3, 0
      M[2]   = 16'h8213;   // ld r2, r3, 1
      M[3]   = 16'hD008;   // jal add
      M[4]   = 16'h9203;   // st r0, r3, 2
      M[5]   = 16'hF000;   // quit
   
      M[8]   = 16'h0012;   // add r0, r1, r2
      M[9]   = 16'hE0F0;   // jr 15
      
      M[32]  = 6;
      M[33]  = 4;
   end
   **/
   
   /**/
   initial begin
   // Call Using Stack
      M[0]   = 16'h7EFF;
      M[1]   = 16'h7003;
      M[2]   = 16'h1EE0;
      M[3]   = 16'h7003;
      M[4]   = 16'h900E;
      M[5]   = 16'h7004;
      M[6]   = 16'h910E;
      M[7]   = 16'hD00E;
      M[8]   = 16'h802E;
      M[9]   = 16'h7140;
      M[10]  = 16'h9001;
      M[11]  = 16'h7003;
      M[12]  = 16'h0EE0;
      M[13]  = 16'hF000;
      M[14]  = 16'h7003;
      M[15]  = 16'h1EE0;
      M[16]  = 16'h92FE;
      M[17]  = 16'h803E;
      M[18]  = 16'h900E;
      M[19]  = 16'hD01C;
      M[20]  = 16'h801E;
      M[21]  = 16'h814E;
      M[22]  = 16'h0001;
      M[23]  = 16'h950E;
      M[24]  = 16'h8F2E;
      M[25]  = 16'h7003;
      M[26]  = 16'h0EE0;
      M[27]  = 16'hE0F0;
      M[28]  = 16'h800E;
      M[29]  = 16'h5002;
      M[30]  = 16'h910E;
      M[31]  = 16'hE0F0;
   end
   /**/
   
   /**
   initial begin
   // Call using stack and registers, v1
      M[0]   = 16'h7EFF;
      M[1]   = 16'h7103;
      M[2]   = 16'h7204;
      M[3]   = 16'hD007;
      M[4]   = 16'h7540;
      M[5]   = 16'h9005;
      M[6]   = 16'hF000;
      M[7]   = 16'h7501;
      M[8]   = 16'h1EE5;
      M[9]   = 16'h90FE;
      M[10]  = 16'h2A22;
      M[11]  = 16'hD011;
      M[12]  = 16'h000A;
      M[13]  = 16'h8F0E;
      M[14]  = 16'h7501;
      M[15]  = 16'h0EE5;
      M[16]  = 16'hE0F0;
      M[17]  = 16'h5012;
      M[18]  = 16'hE0F0;
   end
   **/
   
   /**
   initial begin
   // Call using stack and registers, v2
      M[0]   = 16'h7EFF;
      M[1]   = 16'h7103;
      M[2]   = 16'h7204;
      M[3]   = 16'hD007;
      M[4]   = 16'h7540;
      M[5]   = 16'h9005;
      M[6]   = 16'hF000;
      M[7]   = 16'h7502;
      M[8]   = 16'h1EE5;
      M[9]   = 16'h91FE;
      M[10]  = 16'h90AE;
      M[11]  = 16'h2A22;
      M[12]  = 16'hD013;
      M[13]  = 16'h000A;
      M[14]  = 16'h8A0E;
      M[15]  = 16'h8F1E;
      M[16]  = 16'h7502;
      M[17]  = 16'h0EE5;
      M[18]  = 16'hE0F0;
      M[19]  = 16'h5012;
      M[20]  = 16'hE0F0;
   end
   **/

   
   always @(posedge clk)
      if (we)
         M[addr] <= din;
         
   always @(posedge clk)
      dout <= M[addr];
      
endmodule

