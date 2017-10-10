`timescale 1ns/1ns

module keycode_recognizer_tb ();
	reg			clk;
	reg			reset_n;
	reg			scan_ready;
	reg	[7:0]	scan_code;
	wire	[7:0]	keycode;
	wire			ext;
	wire			make;
	wire			keycode_ready;
	
	keycode_recognizer uut (
		.clk					(clk),
		.reset_n				(reset_n),
		.ps2_key_en			(scan_ready),
		.ps2_key_data		(scan_code),
		.keycode				(keycode),
		.ext					(ext),
		.make					(make),
		.keycode_ready		(keycode_ready)
	);
	
	always
		#5 clk = ~clk;
		
	initial begin
		clk = 0; reset_n = 0; scan_ready = 0; scan_code = 0;
		#10 	reset_n = 1;
		#100 	scan_code = 8'hAA;	scan_ready = 1;
		#10	scan_ready = 0;
		#100;
		#100 	scan_code = 8'hF0;	scan_ready = 1;
		#10	scan_ready = 0;
		#100 	scan_code = 8'hBB;	scan_ready = 1;
		#10	scan_ready = 0;
		#100;
		#100 	scan_code = 8'hE0;	scan_ready = 1;
		#10	scan_ready = 0;
		#100 	scan_code = 8'hCC;	scan_ready = 1;
		#10	scan_ready = 0;
		#100;
		#100 	scan_code = 8'hE0;	scan_ready = 1;
		#10	scan_ready = 0;
		#100 	scan_code = 8'hF0;	scan_ready = 1;
		#10	scan_ready = 0;
		#100 	scan_code = 8'hDD;	scan_ready = 1;
		#10	scan_ready = 0;
		#100;
		#20 	$stop;
	end

endmodule
