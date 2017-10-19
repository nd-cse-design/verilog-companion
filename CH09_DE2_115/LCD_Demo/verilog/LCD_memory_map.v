module LCD_memory_map (
	input		   [4:0]	raddr,
	input		   [7:0]	din,
	input		   [4:0]	waddr,
	output reg	[7:0]	dout
	);
	
   always @(raddr, din, waddr)
      if (waddr == raddr)
         dout = din;
      else
         dout = " ";
	
endmodule
