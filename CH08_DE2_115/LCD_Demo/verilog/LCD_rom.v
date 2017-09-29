/*
------------------------------------------------------------------- 
--                        ASCII HEX TABLE
--  Hex						Low Hex Digit
-- Value  0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
------\----------------------------------------------------------------
--H  2 |  SP  !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /
--i  3 |  0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?
--g  4 |  @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O
--h  5 |  P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _
--   6 |  `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o
--   7 |  p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~ DEL
-----------------------------------------------------------------------
*/

module LCD_rom (
	input		[4:0]	addr,
	output	[7:0]	dout
	);
	
	reg [7:0] m [0:31];
	
	assign dout = m[addr];
	
	initial begin
		// Line 1
		m[8'h00] = 8'h20;
		m[8'h01] = 8'h20;
		m[8'h02] = 8'h20;
		m[8'h03] = 8'h20;
		m[8'h04] = 8'h20;
		m[8'h05] = 8'h20;
		m[8'h06] = "J";
		m[8'h07] = 8'h41;	// A
		m[8'h08] = 8'h79; // y
		m[8'h09] = 8'h20;
		m[8'h0a] = 8'h20;
		m[8'h0b] = 8'h20;
		m[8'h0c] = 8'h20;
		m[8'h0d] = 8'h20;
		m[8'h0e] = 8'h20;
		m[8'h0f] = 8'h20;
		// Line 2
		m[8'h10] = 8'h20;
		m[8'h11] = 8'h20;
		m[8'h12] = 8'h20;
		m[8'h13] = 8'h20;
		m[8'h14] = 8'h20;
		m[8'h15] = 8'h20;
		m[8'h16] = 8'h20;
		m[8'h17] = 8'h41;	// B
		m[8'h18] = 8'h20;
		m[8'h19] = 8'h20;
		m[8'h1a] = 8'h20;
		m[8'h1b] = 8'h20;
		m[8'h1c] = 8'h20;
		m[8'h1d] = 8'h20;
		m[8'h1e] = 8'h20;
		m[8'h1f] = 8'h20;
	end
	
endmodule
