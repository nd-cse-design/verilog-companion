module alu (
   input [15:0] a,
   input [15:0] b,
   input [7:0] imm,
   input [3:0] shamt,
   input [2:0] op,
   output reg [15:0] f
   );
   
   always @(*)
      case (op)
         0: f = a + b;
         1: f = a - b;
         2: f = a & b;
         3: f = a | b;
         4: f = ~a;
         5: f = a << shamt;
         6: f = a >> shamt;
         7: f = {8'h00, imm};
      endcase
   
endmodule
