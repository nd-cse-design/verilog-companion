module test_ram (
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
     
   reg [15:0] M [0:65535];
   
   /**
   initial begin
      M[0]  = {LDI, R0, 8'd4};         // R0 = 4
      M[1]  = {LDI, R1, 8'd5};         // R1 = 5
      M[2]  = {ADD, R3, R0, R1};       // R3 = R0 + R1
      M[3]  = {SHL, R4, R3, 4'd4};     // R4 = R3 << 4
      M[4]  = {SHR, R5, R4, 4'd5};     // R5 = R4 >> 5
      M[5]  = {LDI, R2, 8'h80};        // R2 = 0x80
      M[6]  = {ST,  4'hf, R1, R2};     // M[R2+0xf] = R1
      M[7]  = {LD,  R6, 4'hf, R2};     // R6 = M[R2+0xf]
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
      M[20] = {BR, -8'd1, XX};         // PC = PC - 1
   end
   **/
   
   /**
   initial begin
      M[0]  = {LDI, R0, 8'h01};
      M[1]  = {LDI, R1, 8'hff};
      M[2]  = {LDI, R2, 8'hab};
      M[3]  = {SHL, R0, R0, 4'd8};
      M[4]  = {OR,  R0, R0, R1};
      M[5]  = {ST,  XX, R2, R0};
      M[6]  = {QUIT, 12'd0};
   end
   **/
   
   /**
   initial begin
      M[0]  = {LDI, R0, 8'h07};
      M[1]  = {JAL, 12'd16};
      M[2]  = {ADD, R2, R0, R1};
      M[3]  = {QUIT, 12'd0};
      M[16] = {LDI, R1, 8'h03};
      M[17] = {JR, XX, R15, XX};
   end
   **/
   
   /**
   initial begin
   // Maxfinder
   // mar:        r0
   // mdr:        r1
   // max:        r2
   // cmp:        r3
   // const_1:    r4
   // const_79:   r5
   
      M[0]  = {LDI, R4, 8'd1    };   //                r4 = 1
      M[1]  = {LDI, R5, 8'd79   };   //                r5 = 79
      M[2]  = {LDI, R0, 8'd64   };   //                mar = 64
      M[3]  = {LDI, R2, 8'd0    };   //                max = 0
      M[4]  = {LD,  R1, 4'd0, R0};   // read_mem:      mdr = M[mar]
      M[5]  = {SUB, R3, R1, R2  };   //                if ((mdr - max) < 0) goto update_mar
      M[6]  = {BN,  8'd2, R3    };   //
      M[7]  = {AND, R2, R1, R1  };   //                max = mdr
      M[8]  = {SUB, R3, R0, R5  };   // update_mar:    if ((mar - 79) == 0) goto end
      M[9]  = {BZ,  8'd3, R3    };   //
      M[10] = {ADD, R0, R0, R4  };   //                mar = mar + 1
      M[11] = {BR,  -8'd7,  XX  };   //                goto read_mem
      M[12] = {QUIT, XX, XX, XX };   // end:           quit
      
      M[64] = 16'd1;
      M[65] = 16'd0;
      M[66] = 16'd0;
      M[67] = 16'd7;
      M[68] = 16'd0;
      M[69] = 16'd0;
      M[70] = 16'd0;
      M[71] = 16'd0;
      M[72] = 16'd0;
      M[73] = 16'd5;
      M[74] = 16'd0;
      M[75] = 16'd0;
      M[76] = 16'd10;
      M[77] = 16'd0;
      M[78] = 16'd0;
      M[79] = 16'd0;
   end
   **/

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
     
   initial begin
      M[0]  = 16'h7720;  // ldi r7, 32
      M[1]  = 16'h8107;  // ld r1, r7, 0
      M[2]  = 16'h8217;  // ld r2, r7, 1
      M[3]  = 16'hD006;  // jal mt
      M[4]  = 16'h9207;  // st r0, r7, 2
      M[5]  = 16'hF000;  // quit
      M[6]  = 16'h7601;  // ldi r6, 1
      M[7]  = 16'h7000;  // ldi r0, 0
      M[8]  = 16'h7508;  // ldi r5, 8
      M[9]  = 16'h7301;  // ldi r3, 1
      M[10] = 16'hB085;  // bz r5, 8
      M[11] = 16'h2432;  // and r4, r3, r2
      M[12] = 16'hB024;  // bz r4, 2
      M[13] = 16'h0001;  // add r0, r0, r1
      M[14] = 16'h5111;  // shl r1, r1, 1
      M[15] = 16'h5331;  // shl r3, r3, 1
      M[16] = 16'h1556;  // sub r5, r5, r6
      M[17] = 16'hAF90;  // br -7
      M[18] = 16'hE0F0;  // jr 15
      
      M[32] = 16'd3;
      M[33] = 16'd5;
   end

   
   always @(posedge clk)
      if (we)
         M[addr] <= din;
         
   always @(posedge clk)
      dout <= M[addr];
      
endmodule

