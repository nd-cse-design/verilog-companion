module pc_update (
   input [15:0] pc,
   input [7:0] disp,
   input s,
   output reg [15:0] next_pc
   );
   
   always @(*)
      if (s)
         if (disp[7])
            next_pc = pc + {8'hff, disp};
         else
            next_pc = pc + {8'h00, disp};         
      else
         next_pc = pc + 16'd1;
         
endmodule
