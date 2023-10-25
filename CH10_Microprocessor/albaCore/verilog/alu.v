module alu (
   input      [15:0] a,
   input      [15:0] b,
   input      [3:0]  alu_op,
   input      [11:0] inst12,
   input      [15:0] pc,
   output reg [15:0] out,
   output            neg,
   output            zero
   );

   wire [7:0]  imm         = inst12[7:0];
   wire [7:0]  disp        = inst12[11:4];
   wire [3:0]  offset_ld   = inst12[7:4];
   wire [3:0]  offset_st   = inst12[11:8];
   
   assign neg              = b[15];
   assign zero             = b == 0;
   
   always @(*)
      case (alu_op)
         0:  out = a + b;
         1:  out = a - b;
         2:  out = a & b;
         3:  out = a | b;
         4:  out = ~a;
         5:  out = a << b;
         6:  out = a >> b;
         7:  out = {8'h00, imm};
         8:  out = b + {8'd0, offset_ld};                              // ld
         9:  out = b + {8'd0, offset_st};                              // st
         10: out = pc + 1;                                             // continue
         11: out =  pc + ( disp[7] ? {8'hff, disp} : {8'h00, disp} );  // take branch
         12: out = {pc[15:12], inst12};                                // jump target
         13: out = a;                                                  // jr
         default: out = 0;
      endcase
   
endmodule
