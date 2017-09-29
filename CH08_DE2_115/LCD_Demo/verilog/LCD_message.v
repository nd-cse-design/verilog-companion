module LCD_message (
	input		   [4:0]	raddr,
	input		   [7:0]	din,
	output reg	[7:0]	dout
	);
	
   always @(raddr, din)
      case (raddr)
         0: dout = "A";
         1: dout = "S";
         2: dout = "C";
         3: dout = "I";
         4: dout = "I";
         5: dout = ":";
         6: dout = " ";
         7: dout = din;
         default: dout = " ";
      endcase
	
endmodule
