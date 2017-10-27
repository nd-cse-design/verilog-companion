module rom (
   input       [3:0] addr,
   output reg  [3:0] dout
   );
   
   always @(*)
      case (addr)
         1:    dout = 1;
         3:    dout = 7;
         9:    dout = 5;
         12:   dout = 10;
         default: dout = 0;
      endcase
   
endmodule
