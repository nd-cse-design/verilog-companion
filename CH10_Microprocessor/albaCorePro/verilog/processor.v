module processor (
   input             clk,
   input             reset,
   input    [15:0]   din,
   output   [15:0]   addr,
   output   [15:0]   dout,
   output            we
   );
   
   wire         s_addr;
   wire         en_inst;
   wire         en_a;
   wire         en_b;
   wire [2:0]   alu_op;
   wire         en_f;
   wire         en_mdr;
   wire         s_regfile_din;
   wire         we_regfile;
   wire         s_next_pc;
   wire         en_pc;
   wire [3:0]   opcode;
   wire         zero;
   wire         neg;
   
   controller controller (
      .clk           (clk          ),
      .reset         (reset        ),
      .s_addr        (s_addr       ),
      .en_inst       (en_inst      ),
      .en_a          (en_a         ),
      .en_b          (en_b         ),
      .alu_op        (alu_op       ),
      .en_f          (en_f         ),
      .en_mdr        (en_mdr       ),
      .s_regfile_din (s_regfile_din),
      .we_regfile    (we_regfile   ),
      .s_next_pc     (s_next_pc    ),
      .en_pc         (en_pc        ),
      .opcode        (opcode       ),
      .zero          (zero         ),
      .neg           (neg          ),
      .we_mem        (we           )
   );
   
   datapath datapath (
      .clk           (clk          ),
      .s_addr        (s_addr       ),
      .en_inst       (en_inst      ),
      .en_a          (en_a         ),
      .en_b          (en_b         ),
      .alu_op        (alu_op       ),
      .en_f          (en_f         ),
      .en_mdr        (en_mdr       ),
      .s_regfile_din (s_regfile_din),
      .we_regfile    (we_regfile   ),
      .s_next_pc     (s_next_pc    ),
      .en_pc         (en_pc        ),
      .opcode        (opcode       ),
      .zero          (zero         ),
      .neg           (neg          ),
      .din           (din          ),
      .addr          (addr         ),
      .dout          (dout         )
   );
   
endmodule
