module keycode_to_ascii (
	input 		[7:0] keycode,
	output reg	[7:0]	ascii
	);
	
	always @(*)
		case (keycode)
			8'h1C: ascii = "A";
			8'h32: ascii = "B";
			8'h21: ascii = "C";
			8'h23: ascii = "D";
			8'h24: ascii = "E";
			8'h2B: ascii = "F";
			8'h34: ascii = "G";
			8'h33: ascii = "H";
			8'h43: ascii = "I";
			8'h3B: ascii = "J";
			8'h42: ascii = "K";
			8'h4B: ascii = "L";
			8'h3A: ascii = "M";
			8'h31: ascii = "N";
			8'h44: ascii = "O";
			8'h4D: ascii = "P";
			8'h15: ascii = "Q";
			8'h2D: ascii = "R";
			8'h1B: ascii = "S";
			8'h2C: ascii = "T";
			8'h3C: ascii = "U";
			8'h2A: ascii = "V";
			8'h1D: ascii = "W";
			8'h22: ascii = "X";
			8'h35: ascii = "Y";
			8'h1A: ascii = "Z";
			8'h45: ascii = "0";
			8'h16: ascii = "1";
			8'h1E: ascii = "2";
			8'h26: ascii = "3";
			8'h25: ascii = "4";
			8'h2E: ascii = "5";
			8'h36: ascii = "6";
			8'h3D: ascii = "7";
			8'h3E: ascii = "8";
			8'h46: ascii = "9";
			8'h29: ascii = " ";
			default: ascii = ".";
		endcase
		
endmodule
