module LCD_ram (
	input				clk,
	input		[4:0]	raddr,
	input		[7:0]	din,
	input		[4:0]	waddr,
	input				we,
	output	[7:0]	dout
	);
	
	reg [7:0] m [0:31];
	
	always@(posedge clk)
		if (we)
			m[waddr] <= din;
	
	assign dout = m[raddr];
	
	initial begin
		// Line 1
		m[8'h00] = "L";
		m[8'h01] = "C";
		m[8'h02] = "D";
		m[8'h03] = " ";
		m[8'h04] = " ";
		m[8'h05] = " ";
		m[8'h06] = " ";
		m[8'h07] = " ";
		m[8'h08] = " ";
		m[8'h09] = " ";
		m[8'h0a] = " ";
		m[8'h0b] = " ";
		m[8'h0c] = " ";
		m[8'h0d] = " ";
		m[8'h0e] = " ";
		m[8'h0f] = " ";
		// Line 2
		m[8'h10] = "D";
		m[8'h11] = "e";
		m[8'h12] = "m";
		m[8'h13] = "o";
		m[8'h14] = "n";
		m[8'h15] = "s";
		m[8'h16] = "t";
		m[8'h17] = "r";
		m[8'h18] = "a";
		m[8'h19] = "t";
		m[8'h1a] = "i";
		m[8'h1b] = "o";
		m[8'h1c] = "n";
		m[8'h1d] = " ";
		m[8'h1e] = " ";
		m[8'h1f] = " ";
	end
	
endmodule
