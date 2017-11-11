module datapath (
   input          clk,
   input          s_addr,
   input          en_inst,
   input          en_a,
   input          en_b,
   input  [2:0]   alu_op,
   input          en_f,
   input          en_mdr,
   input          s_regfile_din,
   input          we_regfile,
   input          s_next_pc,
   input          en_pc,
   output [3:0]   opcode,
   output         zero,
   output         neg,
   input  [15:0]  din,
   output [15:0]  addr,
   output [15:0]  dout
   );
   
   wire [15:0] inst;
   assign      opcode         = inst[15:12];
   wire [3:0]  rw             = inst[11:8];
   wire [3:0]  ra             = inst[7:4];
   wire [3:0]  rb             = inst[3:0];
   wire [7:0]  imm            = inst[7:0];
   wire [7:0]  disp           = inst[11:4];
   wire [3:0]  shamt          = inst[3:0];
   wire [15:0] regfile_din;
   wire [15:0] regfile_a;
   wire [15:0] a;
   wire [15:0] regfile_b;
   wire [15:0] b;
   wire [15:0] next_pc;
   wire [15:0] pc;
   wire [15:0] alu_f;
   wire [15:0] f;
   wire [15:0] mdr;
   
   assign regfile_din   = s_regfile_din ? mdr : f;
   assign addr          = s_addr ? b : pc;
   assign dout          = a;
   
   regfile regfile (
      .clk     (clk),
      .din     (regfile_din),
      .waddr   (rw),
      .raddra  (ra),   
      .raddrb  (rb),
      .we      (we_regfile),
      .douta   (regfile_a),   
      .doutb   (regfile_b)
   );
   
   reg16 pc_reg (
      .clk     (clk),
      .en      (en_pc),
      .d       (next_pc),
      .q       (pc)
   );
   
   reg16 inst_reg (
      .clk     (clk),
      .en      (en_inst),
      .d       (din),
      .q       (inst)
   );
   
   reg16 a_reg (
      .clk     (clk),
      .en      (en_a),
      .d       (regfile_a),
      .q       (a)
   );
   
   reg16 b_reg (
      .clk     (clk),
      .en      (en_b),
      .d       (regfile_b),
      .q       (b)
   );
   
   reg16 f_reg (
      .clk     (clk),
      .en      (en_f),
      .d       (alu_f),
      .q       (f)
   );
   
   reg16 mdr_reg (
      .clk     (clk),
      .en      (en_mdr),
      .d       (din),
      .q       (mdr)
   );
   
   pc_update pc_update (
      .pc      (pc),
      .disp    (disp),
      .s       (s_next_pc),
      .next_pc (next_pc)
   );
   
   alu alu (
      .a       (a),
      .b       (b),
      .imm     (imm),
      .shamt   (shamt),
      .op      (alu_op),
      .f       (alu_f)
   );
   
   flags flags (
      .b       (b),
      .neg     (neg),
      .zero    (zero)
   );
   
endmodule
