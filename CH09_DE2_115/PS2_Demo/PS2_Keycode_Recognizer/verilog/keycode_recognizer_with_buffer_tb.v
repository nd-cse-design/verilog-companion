`timescale 1ns/1ns

module keycode_recognizer_with_buffer_tb ();
	reg         clk;
	reg         reset_n;
   reg         clear;
	reg         scan_ready;
	reg   [7:0] scan_code;
	wire  [7:0] keycode;
	wire        ext;
	wire        make;
	wire        got_one;
	
	keycode_recognizer_with_buffer uut (
		.clk              (clk),
      .clear            (clear),
      .reset_n          (reset_n),
		.scan_ready       (scan_ready),
		.scan_code        (scan_code),
		.keycode          (keycode),
		.ext              (ext),
		.make             (make),
      .got_one          (got_one)
	);
	
	always
		#5 clk = ~clk;
		
	initial begin
		clk = 0; reset_n = 0; clear = 0; scan_ready = 0; scan_code = 0;
		#10 	reset_n = 1;
		#100 	scan_code = 8'hAA;	scan_ready = 1;
		#10	scan_ready = 0;
		#100; clear = 1;
		#10   clear = 0;
		#20 	$stop;
	end

endmodule
