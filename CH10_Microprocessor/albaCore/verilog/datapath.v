module datapath (
   input          clk,
   input          s_addr,
   input          en_inst,
   input          en_a,
   input          en_b,
   input  [3:0]   alu_op,
   input          en_f,
   input          en_mdr,
   input          s_regfile_din,
   input          we_regfile,
   input          s_regfile_rw,
   input          en_pc,
   output [3:0]   opcode,
   output         zero,
   output         neg,
   input  [15:0]  din,
   output [15:0]  addr,
   output [15:0]  dout
   );
   
   wire [15:0] inst;
   wire [11:0] inst12         = inst[11:0];
   assign      opcode         = inst[15:12];
   wire [3:0]  rw             = inst[11:8];
   wire [3:0]  ra             = inst[7:4];
   wire [3:0]  rb             = inst[3:0];
   wire [3:0]  regfile_rw;
   wire [15:0] regfile_din;
   wire [15:0] regfile_a;
   wire [15:0] a;
   wire [15:0] regfile_b;
   wire [15:0] b;
   wire [15:0] next_pc;
   wire [15:0] pc;
   wire [15:0] alu_out;
   wire [15:0] f;
   wire [15:0] mdr;
   
   assign dout          = a;
   assign regfile_rw    = s_regfile_rw ? 4'd15 : rw;
   assign regfile_din   = s_regfile_din ? mdr : f;
   assign addr          = s_addr ? f : pc;
   
   regfile regfile (
      .clk     (clk),
      .din     (regfile_din),
      .waddr   (regfile_rw),
      .raddra  (ra),   
      .raddrb  (rb),
      .we      (we_regfile),
      .douta   (regfile_a),   
      .doutb   (regfile_b)
   );
   
   reg16 pc_reg (
      .clk     (clk),
      .en      (en_pc),
      .d       (alu_out),
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
      .d       (alu_out),
      .q       (f)
   );
   
   reg16 mdr_reg (
      .clk     (clk),
      .en      (en_mdr),
      .d       (din),
      .q       (mdr)
   );
   
   alu alu (
      .a       (a),
      .b       (b),
      .alu_op  (alu_op),
      .inst12  (inst12),
      .pc      (pc),
      .out     (alu_out),
      .neg     (neg),
      .zero    (zero)
   );
   
endmodule
