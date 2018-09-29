module hello_ram (
	input	   	   clk,
	input	   [4:0] raddr,
	input	   [7:0] din,
	input	   [4:0] waddr,
	input	   	   we,
	output   [7:0] dout
	);
	
   reg [7:0] m [0:31];
   
   always@(posedge clk)
      if (we)
         m[waddr] <= din;
   
   assign dout = m[raddr];
   
   initial begin
		// Line 1
		m[8'h00] = "H";
		m[8'h01] = "e";
		m[8'h02] = "l";
		m[8'h03] = "l";
		m[8'h04] = "o";
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
		m[8'h10] = "W";
		m[8'h11] = "o";
		m[8'h12] = "r";
		m[8'h13] = "l";
		m[8'h14] = "d";
		m[8'h15] = " ";
		m[8'h16] = " ";
		m[8'h17] = " ";
		m[8'h18] = " ";
		m[8'h19] = " ";
		m[8'h1a] = " ";
		m[8'h1b] = " ";
		m[8'h1c] = " ";
		m[8'h1d] = " ";
		m[8'h1e] = " ";
		m[8'h1f] = " ";
	end
	
endmodule
