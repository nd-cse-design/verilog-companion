module ram (
   input clk,
   input [15:0] addr,
   input [15:0] din,
   input we,
   output reg [15:0] dout
   );
   
   parameter ADD  = 4'd0;
   parameter SUB  = 4'd1;
   parameter AND  = 4'd2;
   parameter OR   = 4'd3;
   parameter NOT  = 4'd4;
   parameter SHL  = 4'd5;
   parameter SHR  = 4'd6;
   parameter LDI  = 4'd7;
   parameter LD   = 4'd8;
   parameter ST   = 4'd9;
   parameter BR   = 4'd10;
   parameter BZ   = 4'd11;
   parameter BN   = 4'd12;
   parameter QUIT = 4'd15;
   
   parameter R0   = 4'd0;
   parameter R1   = 4'd1;
   parameter R2   = 4'd2;
   parameter R3   = 4'd3;
   parameter R4   = 4'd4;
   parameter R5   = 4'd5;
   parameter R6   = 4'd6;
   parameter R7   = 4'd7;
   parameter R8   = 4'd8;
   parameter R9   = 4'd9;
   parameter R10  = 4'd10;
   parameter R11  = 4'd11;
   parameter R12  = 4'd12;
   parameter R13  = 4'd13;
   parameter R14  = 4'd14;
   parameter R15  = 4'd15;
   parameter XX   = 4'd0;
     
   reg [15:0] M [0:65535];
   
   /**
   initial begin
      M[0]  = {LDI, R0, 8'd4};         // R0 = 4
      M[1]  = {LDI, R1, 8'd5};         // R1 = 5
      M[2]  = {ADD, R3, R0, R1};       // R3 = R0 + R1
      M[3]  = {SHL, R4, R3, 4'd4};     // R4 = R3 << 4
      M[4]  = {SHR, R5, R4, 4'd5};     // R5 = R4 >> 5
      M[5]  = {LDI, R2, 8'h80};        // R2 = 0x80
      M[6]  = {ST,  XX, R1, R2};       // M[R2] = R1
      M[7]  = {LD,  R6, XX, R2};       // R6 = M[R2]
      M[8]  = {LDI, R10, 8'd0};        // R10 = 0
      M[9]  = {LDI, R11, 8'h80};       // R11 = 0x80
      M[10] = {LDI, R12, 8'd8};        // R12 = 8
      M[11] = {SHL, R11, R11, 4'd8};   // R11 = R << 8 (0x8000)
      M[12] = {BR,  8'd2, XX};         // PC = PC + 2
      M[14] = {BZ,  8'd16, R11};       // if (R11 == 0) PC = PC + 16 (false)
      M[15] = {BZ,  8'd2, R10};        // if (R10 == 0) PC = PC + 2  (true)
      M[17] = {BN,  8'd16, R10};       // if (R10 < 0)  PC = PC + 16 (false)
      M[18] = {BN,  8'd2, R11};        // if (R11 < 0)  PC = PC + 2  (true)
      M[19] = {QUIT, 12'd0};           // quit
      M[20] = {BR, -8'd1, XX};         // PC = PC -1
   end
   **/
   
   /**/
   initial begin
      M[0]  = {LDI, R0, 8'h01};
      M[1]  = {LDI, R1, 8'hff};
      M[2]  = {LDI, R2, 8'hab};
      M[3]  = {SHL, R0, R0, 4'd8};
      M[4]  = {OR,  R0, R0, R1};
      M[5]  = {ST,  XX, R2, R0};
      M[6]  = {QUIT, 12'd0};
   end
   /**/
   
   always @(posedge clk)
      if (we)
         M[addr] <= din;
         
   always @(posedge clk)
      dout <= M[addr];
      
endmodule

