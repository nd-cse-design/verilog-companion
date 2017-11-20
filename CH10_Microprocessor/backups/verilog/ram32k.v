module ram32k (
   input                clk,
   input       [14:0]   addr,
   input       [15:0]   din,
   input                we,
   output reg  [15:0]   dout
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
   parameter JAL  = 4'd13;
   parameter JR   = 4'd14;
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
     
   reg [15:0] M [0:15'h7fff];
   
   initial begin
      M[0]   = {LDI, R0, 8'h80};
      M[1]   = {SHL, R0, R0, 4'd8};  // load SW into r8   (addr = 16'h8001)
      M[2]   = {LD, R8, 4'd1, R0};
      M[3]   = {ST, 4'd0, R8, R0};   // store 4'ha to LED (addr = 16'h8000)
      M[4]   = {BR, -8'd4, XX};
//      M[4]   = {QUIT, XX, XX, XX};
   end
   
   
   always @(posedge clk)
      if (we)
         M[addr] <= din;
         
   always @(posedge clk)
      dout <= M[addr];
      
endmodule

