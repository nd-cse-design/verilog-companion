module hello_rom (
   input       [4:0] addr,
   output reg  [7:0] dout
   );
   
   always @(addr)
      case (addr)
         // Line 1 starts at 0
         0:  dout = "H";
         1:  dout = "e";
         2:  dout = "l";
         3:  dout = "l";
         4:  dout = "o";
         // Line 2 starts at 16
         16: dout = "W";
         17: dout = "o";
         18: dout = "r";
         19: dout = "l";
         20: dout = "d";
         // Blank spaces for all unspecified locations
         default: dout = " ";
      endcase
      
endmodule